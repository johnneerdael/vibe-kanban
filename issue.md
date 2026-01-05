docker compose exec vibe-kanban review --help
```

### GitHub Integration

The GitHub integration requires the GitHub CLI (`gh`) to be authenticated. Since the container uses `/data` for persistence, your authentication will survive container restarts.

To authenticate GitHub CLI inside the container:

```bash
docker compose exec vibe-kanban gh auth login
```

Follow the prompts to authenticate via your browser.

## Environment Variables

You can customize the deployment by modifying the `environment` section in `docker-compose.yml`:

- `RUST_LOG`: Set the logging level (e.g., `debug`, `info`, `warn`, `error`).
- `PORT`: The port the server listens on inside the container (default: `3000`).
- `HOST`: The host the server binds to (default: `0.0.0.0`).
- `AUTH_USER`: (Optional) Username for Basic Auth.
- `AUTH_PASS`: (Optional) Password for Basic Auth.

## Troubleshooting

### View Logs

```bash
docker compose logs -f vibe-kanban
```

### Restart Service

```bash
docker compose restart vibe-kanbanroot@homeassistant:/homeassistant/vibe-kanban# docker compose up -d^C
root@homeassistant:/homeassistant/vibe-kanban# docker compose up -d
#1 [internal] load local bake definitions
#1 reading from stdin 530B done
#1 DONE 0.0s

#2 [internal] load build definition from Dockerfile
#2 transferring dockerfile: 3.40kB done
#2 DONE 0.0s

#3 [internal] load metadata for docker.io/library/rust:1.89-slim-bookworm
#3 ...

#4 [internal] load metadata for docker.io/library/node:20-alpine
#4 DONE 0.8s

#3 [internal] load metadata for docker.io/library/rust:1.89-slim-bookworm
#3 DONE 0.9s

#5 [internal] load metadata for docker.io/library/debian:bookworm-slim
#5 DONE 0.9s

#6 [internal] load .dockerignore
#6 transferring context: 678B done
#6 DONE 0.0s

#7 [fe-builder 1/9] FROM docker.io/library/node:20-alpine@sha256:658d0f63e501824d6c23e06d4bb95c71e7d704537c9d9272f488ac03a370d448
#7 DONE 0.0s

#8 [runtime 1/8] FROM docker.io/library/debian:bookworm-slim@sha256:d5d3f9c23164ea16f31852f95bd5959aad1c5e854332fe00f7b3a20fcc9f635c
#8 DONE 0.0s

#9 [builder 1/9] FROM docker.io/library/rust:1.89-slim-bookworm@sha256:d7fc7de78bb8c1469933aeecbf801314d30d7d6e9f0578bba4cfa285bfa37fe6
#9 DONE 0.0s

#10 [runtime 2/8] RUN apt-get update   && apt-get install -y --no-install-recommends      ca-certificates      libssl3      wget      git      tini      curl   && curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg   && chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg   && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | tee /etc/apt/sources.list.d/github-cli.list > /dev/null   && apt-get update   && apt-get install -y gh   && rm -rf /var/lib/apt/lists/*
#10 CACHED

#11 [runtime 3/8] RUN useradd --system --create-home --uid 10001 appuser
#11 CACHED

#12 [runtime 4/8] RUN mkdir -p /data /repos &&     chown -R appuser:appuser /data /repos
#12 CACHED

#13 [runtime 5/8] WORKDIR /srv
#13 CACHED

#14 [internal] load build context
#14 transferring context: 72.96kB 0.1s done
#14 DONE 0.1s

#15 [fe-builder 5/9] COPY frontend/package.json frontend/package.json
#15 CACHED

#16 [fe-builder 6/9] RUN --mount=type=cache,id=pnpm,target=/pnpm/store     pnpm install --filter ./frontend --frozen-lockfile
#16 CACHED

#17 [fe-builder 7/9] COPY frontend/ frontend/
#17 CACHED

#18 [fe-builder 3/9] RUN corepack enable
#18 CACHED

#19 [fe-builder 4/9] COPY pnpm-lock.yaml pnpm-workspace.yaml package.json ./
#19 CACHED

#20 [fe-builder 2/9] WORKDIR /repo
#20 CACHED

#21 [builder 6/9] COPY shared shared
#21 CACHED

#22 [builder 3/9] WORKDIR /app
#22 CACHED

#23 [builder 2/9] RUN apt-get update   && apt-get install -y --no-install-recommends pkg-config libssl-dev ca-certificates   && rm -rf /var/lib/apt/lists/*
#23 CACHED

#24 [builder 4/9] COPY Cargo.toml Cargo.lock ./
#24 CACHED

#25 [builder 5/9] COPY crates crates
#25 CACHED

#26 [fe-builder 8/9] COPY shared/ shared/
#26 CACHED

#27 [builder 7/9] COPY assets assets
#27 CACHED

#28 [fe-builder 9/9] RUN pnpm -C frontend build
#28 0.947
#28 0.947 > vibe-kanban@0.0.143 build /repo/frontend
#28 0.947 > tsc && vite build
#28 0.947
#28 23.35 vite v5.4.19 building for production...
#28 24.13 [sentry-vite-plugin] Info: Sending telemetry data on issues and performance to Sentry. To disable telemetry, set `options.telemetry` to `false`.
#28 24.51 transforming...
#28 28.43 Browserslist: browsers data (caniuse-lite) is 8 months old. Please run:
#28 28.43   npx update-browserslist-db@latest
#28 28.43   Why you should do it regularly: https://github.com/browserslist/update-db#readme
#28 58.33 ✓ 4330 modules transformed.
#28 69.30 rendering chunks...
#28 78.18 computing gzip size...
#28 78.22 [sentry-vite-plugin] Warning: No auth token provided. Will not upload source maps. Please set the `authToken` option. You can find information on how to generate a Sentry auth token here: https://docs.sentry.io/api/auth/
#28 79.23 error: Auth token is required for this request. Please run `sentry-cli login` and try again!
#28 79.23
#28 79.23 Add --log-level=[info|debug] or export SENTRY_LOG_LEVEL=[info|debug] to see more output.
#28 79.23 Please attach the full debug log to all bug reports.
#28 79.24 [sentry-vite-plugin] Info: Successfully uploaded source maps to Sentry
#28 79.50 dist/index.html                     0.72 kB │ gzip:     0.38 kB
#28 79.50 dist/assets/index-BtBQA_ur.css     88.71 kB │ gzip:    15.57 kB
#28 79.50 dist/assets/index-yqy_UUUH.js   4,234.24 kB │ gzip: 1,345.28 kB │ map: 20,994.67 kB
#28 79.50
#28 79.50 (!) Some chunks are larger than 500 kB after minification. Consider:
#28 79.50 - Using dynamic import() to code-split the application
#28 79.50 - Use build.rollupOptions.output.manualChunks to improve chunking: https://rollupjs.org/configuration-options/#output-manualchunks
#28 79.50 - Adjust chunk size limit for this warning via build.chunkSizeWarningLimit.
#28 79.51 ✓ built in 55.39s
#28 DONE 80.1s

#29 [builder 8/9] COPY --from=fe-builder /repo/frontend/dist frontend/dist
#29 DONE 0.3s

#30 [builder 9/9] RUN --mount=type=cache,target=/usr/local/cargo/registry     --mount=type=cache,target=/usr/local/cargo/git     --mount=type=cache,target=/app/target     cargo build --locked --release --bin server --bin mcp_task_server --bin review  && mkdir -p /app/bin  && cp target/release/server /app/bin/server  && cp target/release/mcp_task_server /app/bin/mcp_task_server  && cp target/release/review /app/bin/review
#30 1.113     Updating crates.io index
#30 1.369     Updating git repository `https://github.com/xazukx/ts-rs.git`
#30 2.769     Updating git repository `https://github.com/openai/codex.git`
#30 12.95 error: the lock file /app/Cargo.lock needs to be updated but --locked was passed to prevent this
#30 12.95 If you want to try to generate the lock file without accessing the network, remove the --locked flag and use --offline instead.
#30 ERROR: process "/bin/sh -c cargo build --locked --release --bin server --bin mcp_task_server --bin review  && mkdir -p /app/bin  && cp target/release/server /app/bin/server  && cp target/release/mcp_task_server /app/bin/mcp_task_server  && cp target/release/review /app/bin/review" did not complete successfully: exit code: 101
------
 > [builder 9/9] RUN --mount=type=cache,target=/usr/local/cargo/registry     --mount=type=cache,target=/usr/local/cargo/git     --mount=type=cache,target=/app/target     cargo build --locked --release --bin server --bin mcp_task_server --bin review  && mkdir -p /app/bin  && cp target/release/server /app/bin/server  && cp target/release/mcp_task_server /app/bin/mcp_task_server  && cp target/release/review /app/bin/review:
1.113     Updating crates.io index
1.369     Updating git repository `https://github.com/xazukx/ts-rs.git`
2.769     Updating git repository `https://github.com/openai/codex.git`
12.95 error: the lock file /app/Cargo.lock needs to be updated but --locked was passed to prevent this
12.95 If you want to try to generate the lock file without accessing the network, remove the --locked flag and use --offline instead.
------
Dockerfile:43

--------------------

  42 |     # Build all binaries

  43 | >>> RUN --mount=type=cache,target=/usr/local/cargo/registry \

  44 | >>>     --mount=type=cache,target=/usr/local/cargo/git \

  45 | >>>     --mount=type=cache,target=/app/target \

  46 | >>>     cargo build --locked --release --bin server --bin mcp_task_server --bin review \

  47 | >>>  && mkdir -p /app/bin \

  48 | >>>  && cp target/release/server /app/bin/server \

  49 | >>>  && cp target/release/mcp_task_server /app/bin/mcp_task_server \

  50 | >>>  && cp target/release/review /app/bin/review

  51 |

--------------------

failed to solve: process "/bin/sh -c cargo build --locked --release --bin server --bin mcp_task_server --bin review  && mkdir -p /app/bin  && cp target/release/server /app/bin/server  && cp target/release/mcp_task_server /app/bin/mcp_task_server  && cp target/release/review /app/bin/review" did not complete successfully: exit code: 101
