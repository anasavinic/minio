# Base na imagem oficial do MinIO
FROM minio/minio:latest

# Variáveis de root
ENV MINIO_ROOT_USER=admin
ENV MINIO_ROOT_PASSWORD=brdc#havi$brsc1543

# Instala CLI mc (se não estiver incluída na imagem)
RUN curl -O https://dl.min.io/client/mc/release/linux-amd64/mc \
    && chmod +x mc \
    && mv mc /usr/bin/mc

# Copia o entrypoint personalizado
COPY docker-entrypoint.sh /usr/bin/docker-entrypoint.sh
RUN chmod +x /usr/bin/docker-entrypoint.sh

# Entrypoint e CMD padrão
ENTRYPOINT ["/usr/bin/docker-entrypoint.sh"]
CMD ["server", "/data", "--console-address", ":9001"]
