FROM minio/minio:latest

ENV MINIO_ROOT_USER=admin
ENV MINIO_ROOT_PASSWORD=admin123

RUN curl -O https://dl.min.io/client/mc/release/linux-amd64/mc \
    && chmod +x mc \
    && mv mc /usr/bin/mc

EXPOSE 9000
EXPOSE 9001

CMD ["server", "/data", "--console-address", ":9001"]
