#!/usr/bin/env bash

SOURCE="$1"
TIMESTAMP=$(date +%Y%m%d-%H%M%S)

mkdir -p backups

tar -czf "backups/backup-$TIMESTAMP.tar.gz" "$SOURCE"

echo "Backup utworzony: backup-$TIMESTAMP.tar.gz"
