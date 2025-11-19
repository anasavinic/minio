#!/bin/bash
set -e

# Configura o alias 'localminio' usando mc
mc alias set localminio http://127.0.0.1:9000 $MINIO_ROOT_USER $MINIO_ROOT_PASSWORD

# Cria o bucket 'havi' se não existir
mc mb --ignore-existing localminio/havi

# Define política de leitura pública
mc anonymous set download localminio/havi

# Aqui você pode adicionar mais buckets, políticas ou usuários
# Exemplo:
# mc admin user add localminio newuser newpassword
# mc anonymous set upload localminio/anotherbucket

# Inicia o MinIO em foreground
exec minio server /data --console-address ":9001"
