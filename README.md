<p align="center">
  <a href="https://github.com/johnneerdael/vibe-kanban">
    <picture>
      <source srcset="frontend/public/vibe-kanban-logo-dark.svg" media="(prefers-color-scheme: dark)">
      <source srcset="frontend/public/vibe-kanban-logo.svg" media="(prefers-color-scheme: light)">
      <img src="frontend/public/vibe-kanban-logo.svg" alt="Vibe Kanban Logo">
    </picture>
  </a>
</p>

<p align="center">Orchestrate AI coding agents with confidence. Plan, review, and manage AI-generated code in isolated git worktrees.</p>
<p align="center">
  <a href="https://hub.docker.com/r/johnneerdael/vibe-kanban"><img alt="Docker Image Version" src="https://img.shields.io/docker/v/johnneerdael/vibe-kanban?label=docker&style=flat-square" /></a>
  <a href="https://github.com/johnneerdael/vibe-kanban/actions/workflows/docker-publish.yml"><img alt="Build status" src="https://img.shields.io/github/actions/workflow/status/johnneerdael/vibe-kanban/docker-publish.yml?style=flat-square" /></a>
</p>

![](frontend/public/vibe-kanban-screenshot-overview.png)

## Overview

Vibe Kanban is an orchestration platform for AI coding agents that helps developers plan, review, and safely execute AI-assisted coding tasks. This branch is optimized for **Docker-only deployment**, providing a stable, containerized environment for your AI workflows.

- **Safe AI Execution**: Every task runs in an isolated git worktree.
- **Multi-Agent Support**: Switch between Claude Code, OpenAI Codex, Amp, Cursor Agent CLI, Gemini, and more.
- **Visual Code Review**: Review AI changes with line-by-line diffs and send feedback back to the agent.
- **Persistence**: SQLite database and repository storage are persisted via Docker volumes.

## Quick Start

The easiest way to run Vibe Kanban is using Docker Compose.

### 1. Create a `docker-compose.yml`

```yaml
services:
  vibe-kanban:
    image: johnneerdael/vibe-kanban:main
    ports:
      - "3000:3000"
    volumes:
      - ./data:/data
      - ./repos:/repos
    environment:
      - RUST_LOG=info
      - AUTH_USER=admin    # Optional: Enable Basic Auth
      - AUTH_PASS=password # Optional: Enable Basic Auth
    restart: unless-stopped
```

### 2. Launch

```bash
docker compose up -d
```

Access the UI at [http://localhost:3000](http://localhost:3000).

## Documentation

For detailed guides on configuration, agent setup, and advanced features, visit our [Documentation](https://github.com/johnneerdael/vibe-kanban/tree/main/docs).

- [Getting Started](./docs/getting-started.mdx)
- [Supported Agents](./docs/supported-coding-agents.mdx)
- [GitHub Integration](./docs/integrations/github-integration.md)

## GitHub Integration

To enable GitHub integration (creating PRs), authenticate the GitHub CLI inside the container:

```bash
docker compose exec vibe-kanban gh auth login
```

## Support & Contributing

Please open an issue on this repository for bugs or feature requests. We welcome contributions that align with the Docker-first roadmap.

---
<p align="center">Built with Rust and React.</p>