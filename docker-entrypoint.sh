#!/bin/sh

echo "Aguardando MinIO iniciar..."
# Espera alguns segundos para garantir que o MinIO esteja pronto
sleep 10

export MINIO_ROOT_USER="${MINIO_ROOT_USER}"
export MINIO_ROOT_PASSWORD="${MINIO_ROOT_PASSWORD}"

# Inicializa o alias 'localminio' no mc
mc alias set localminio http://127.0.0.1:9000 "${MINIO_ROOT_USER}" "${MINIO_ROOT_PASSWORD}"

# Cria o bucket se não existir
mc mb --ignore-existing localminio/"${MINIO_BUCKET}"

# Define permissão pública de download
mc anonymous set download localminio/"${MINIO_BUCKET}"

# Inicia o MinIO normalmente
exec minio "$@"
