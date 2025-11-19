#!/bin/bash
set -e

# Iniciar MinIO em background
minio server /data --console-address ":9001" &
MINIO_PID=$!

echo "Aguardando MinIO iniciar..."

# Esperar por http://127.0.0.1:9000/minio/health/ready
until curl -s http://127.0.0.1:9000/minio/health/ready > /dev/null; do
    sleep 1
done

echo "MinIO iniciado. Configurando bucket..."

# Configurar mc
mc alias set localminio http://127.0.0.1:9000 $MINIO_ROOT_USER $MINIO_ROOT_PASSWORD

# Criar o bucket 'havi' se não existir
mc mb --ignore-existing localminio/havi

# Tornar o bucket 'havi' público
mc anonymous set download localminio/havi

echo "Bucket 'havi' configurado como público."

# Trazer MinIO para foreground
wait $MINIO_PID
