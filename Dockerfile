# Stage 1: Frontend Builder
FROM node:20-alpine AS fe-builder
WORKDIR /repo

# Enable corepack for pnpm
RUN corepack enable

# Copy workspace files
COPY pnpm-lock.yaml pnpm-workspace.yaml package.json ./
COPY frontend/package.json frontend/package.json

# Install dependencies
RUN --mount=type=cache,id=pnpm,target=/pnpm/store \
    pnpm install --filter ./frontend --frozen-lockfile

# Copy frontend source, shared types, and build
COPY frontend/ frontend/
COPY shared/ shared/
# Increase memory limit for Node.js to avoid OOM during build
ENV NODE_OPTIONS="--max-old-space-size=4096"
RUN pnpm -C frontend build

# Stage 2: Backend Builder
FROM rust:1.89-slim-bookworm AS builder

# Install build dependencies
RUN apt-get update \
  && apt-get install -y --no-install-recommends pkg-config libssl-dev ca-certificates perl \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy workspace files
COPY Cargo.toml Cargo.lock ./
COPY crates crates
COPY shared shared
COPY assets assets

# Copy built frontend for embedding
COPY --from=fe-builder /repo/frontend/dist frontend/dist

# Build all binaries
RUN --mount=type=cache,target=/usr/local/cargo/registry \
    --mount=type=cache,target=/usr/local/cargo/git \
    --mount=type=cache,target=/app/target \
    cargo build --locked --release --bin server --bin mcp_task_server --bin review \
 && mkdir -p /app/bin \
 && cp target/release/server /app/bin/server \
 && cp target/release/mcp_task_server /app/bin/mcp_task_server \
 && cp target/release/review /app/bin/review

# Stage 3: Runtime
FROM debian:bookworm-slim AS runtime

# Install runtime dependencies
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
     ca-certificates \
     libssl3 \
     wget \
     git \
     tini \
     curl \
  && curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
  && chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
  && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
  && apt-get update \
  && apt-get install -y gh \
  && rm -rf /var/lib/apt/lists/*

# Create app user
RUN useradd --system --create-home --uid 10001 appuser

# Set up directories for persistence
RUN mkdir -p /data /repos && \
    chown -R appuser:appuser /data /repos

WORKDIR /srv

# Copy binaries from builder
COPY --from=builder /app/bin/server /usr/local/bin/server
COPY --from=builder /app/bin/mcp_task_server /usr/local/bin/mcp_task_server
COPY --from=builder /app/bin/review /usr/local/bin/review

# Copy frontend assets (embedded in binary via rust-embed, but we can also serve them directly if needed)
# The server binary expects them at ../../frontend/dist relative to where it was built, 
# but rust-embed usually bundles them into the binary.
# If the binary needs them on disk, we'd copy them here.

USER appuser

# Persistence environment
ENV XDG_DATA_HOME=/data \
    XDG_CONFIG_HOME=/data \
    HOST=0.0.0.0 \
    PORT=3000 \
    RUST_LOG=info

EXPOSE 3000

# Health check
HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 \
  CMD ["wget", "--spider", "-q", "http://127.0.0.1:3000/health"]

ENTRYPOINT ["/usr/bin/tini", "--"]
CMD ["server"]