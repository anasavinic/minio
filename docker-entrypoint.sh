#!/bin/bash
set -e

# Iniciar MinIO em background
minio server /data --console-address ":9001" &
MINIO_PID=$!

# Esperar o serviço subir
echo "Aguardando MinIO iniciar..."
until nc -z 127.0.0.1 9000; do
    sleep 1
done

echo "MinIO iniciado. Configurando bucket..."

# Configurar mc
mc alias set localminio http://127.0.0.1:9000 $MINIO_ROOT_USER $MINIO_ROOT_PASSWORD

# Criar bucket havi
mc mb --ignore-existing localminio/havi

# Tornar público (leitura)
mc anonymous set download localminio/havi

echo "Bucket havi configurado como público."

# Voltar o MinIO para foreground
wait $MINIO_PID
