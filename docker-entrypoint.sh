#!/bin/bash
set -e

# Configura o cliente mc dentro do container
mc alias set localminio http://127.0.0.1:9000 $MINIO_ROOT_USER $MINIO_ROOT_PASSWORD

# Cria o bucket 'havi' se não existir
mc mb --ignore-existing localminio/havi

# Define política de leitura pública no bucket 'havi'
mc anonymous set download localminio/havi

# Inicia o MinIO em foreground
exec minio server /data --console-address ":9001"
