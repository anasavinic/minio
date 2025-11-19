FROM minio/minio:latest

ENV MINIO_ROOT_USER=admin
ENV MINIO_ROOT_PASSWORD=admin123
ENV MINIO_BUCKET=havi

COPY docker-entrypoint.sh /usr/bin/docker-entrypoint.sh
RUN chmod +x /usr/bin/docker-entrypoint.sh

EXPOSE 9000 9001

ENTRYPOINT ["/usr/bin/docker-entrypoint.sh"]
