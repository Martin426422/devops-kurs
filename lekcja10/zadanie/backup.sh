#!/usr/bin/env bash

SOURCE="$1"
TIMESTAMP=$(date +%Y%m%d-%H%M%S)

source config.conf

mkdir -p "$BACKUP_DIR"

tar -czf "$BACKUP_DIR/backup-$TIMESTAMP.tar.gz" "$SOURCE"

echo "Backup utworzony: backup-$TIMESTAMP.tar.gz"
