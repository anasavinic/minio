#!/bin/sh

# Inicia o MinIO em background
minio server /data --console-address ":9001" &

# Espera o MinIO subir
echo "Aguardando MinIO iniciar..."
while ! nc -z localhost 9000; do
  sleep 1
done

# Configura alias mc
mc alias set local http://localhost:9000 $MINIO_ROOT_USER $MINIO_ROOT_PASSWORD

# Cria o bucket se não existir
mc mb --ignore-existing local/$MINIO_BUCKET

# Define o bucket como público
mc anonymous set download local/$MINIO_BUCKET

# Mantém o container rodando
wait

