# Vibe Kanban Docker Deployment

This project can be run as a fully functional Docker container using Docker Compose. This setup ensures persistence for your database and repositories.

## Prerequisites

- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)

## Getting Started

1. **Build and start the container:**

   ```bash
   docker compose up -d --build
   ```

2. **Access the application:**

   Open your browser and navigate to [http://localhost:3000](http://localhost:3000).

## Persistence

The Docker Compose setup uses two local directories for persistence:

- `./data`: Stores the SQLite database (`db.sqlite`), `config.json`, `profiles.json`, and GitHub CLI authentication.
- `./repos`: Stores the code repositories managed by the application.

These directories are created automatically on the host machine when the container starts.

## Included Binaries

The Docker image includes the following binaries in `/usr/local/bin/`:

- `server`: The main web application (default entrypoint).
- `mcp_task_server`: The MCP server component.
- `review`: The review CLI tool.

### Running CLI Tools

To run the `review` tool inside the running container:

```bash
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

## Troubleshooting

### View Logs

```bash
docker compose logs -f vibe-kanban
```

### Restart Service

```bash
docker compose restart vibe-kanban