FROM minio/minio:latest

ENV MINIO_ROOT_USER=admin
ENV MINIO_ROOT_PASSWORD=brdc#havi$brsc1543

# Instalar mc manualmente
RUN curl -O https://dl.min.io/client/mc/release/linux-amd64/mc \
    && chmod +x mc \
    && mv mc /usr/bin/mc

COPY docker-entrypoint.sh /usr/bin/docker-entrypoint.sh
RUN chmod +x /usr/bin/docker-entrypoint.sh

ENTRYPOINT ["/usr/bin/docker-entrypoint.sh"]
CMD ["server", "/data", "--console-address", ":9001"]
