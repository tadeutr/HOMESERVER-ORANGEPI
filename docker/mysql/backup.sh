#!/usr/bin/env bash

set -euo pipefail

CONTAINER="mysql"
BACKUP_DIR="/Docker/backups/mysql"
RETENTION=7

umask 077

if [ "$EUID" -ne 0 ]; then
    echo "ERRO: este script deve ser executado como root."
    exit 1
fi

DATE=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_FILE="${BACKUP_DIR}/mysql_${DATE}.sql.gz"
TEMP_FILE="${BACKUP_FILE}.tmp"

echo "[$(date '+%Y-%m-%d %H:%M:%S')] Iniciando backup MySQL..."

mkdir -p "$BACKUP_DIR"

if ! docker inspect "$CONTAINER" \
    --format '{{.State.Health.Status}}' 2>/dev/null \
    | grep -q '^healthy$'; then

    echo "ERRO: container MySQL não está healthy."
    exit 1
fi

echo "[$(date '+%Y-%m-%d %H:%M:%S')] Container MySQL saudável."

docker exec "$CONTAINER" sh -c \
    'MYSQL_PWD="$MYSQL_PASSWORD" mysqldump \
        -uadmin \
        --databases bd_tripoli bd_ricotradesys \
        --single-transaction \
        --routines \
        --triggers \
        --events \
        --no-tablespaces' \
    | gzip > "$TEMP_FILE"

if ! gzip -t "$TEMP_FILE"; then
    echo "ERRO: arquivo de backup inválido."
    rm -f "$TEMP_FILE"
    exit 1
fi

mv "$TEMP_FILE" "$BACKUP_FILE"

echo "[$(date '+%Y-%m-%d %H:%M:%S')] Backup concluído: $BACKUP_FILE"

find "$BACKUP_DIR" \
    -type f \
    -name 'mysql_*.sql.gz' \
    -printf '%T@ %p\n' \
    | sort -nr \
    | tail -n +$((RETENTION + 1)) \
    | cut -d' ' -f2- \
    | xargs -r rm -f

echo "[$(date '+%Y-%m-%d %H:%M:%S')] Retenção aplicada: últimos $RETENTION backups."

echo "[$(date '+%Y-%m-%d %H:%M:%S')] Backup finalizado com sucesso."