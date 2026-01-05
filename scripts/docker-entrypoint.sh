#!/bin/sh
set -e

# Fix permissions for mounted volumes
echo "Ensuring correct permissions for /data and /repos..."
chown -R appuser:appuser /data /repos

# Execute the command as appuser
exec gosu appuser "$@"