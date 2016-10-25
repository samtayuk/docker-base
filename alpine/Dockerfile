FROM alpine:3.4
MAINTAINER Samuel Taylor "samtaylor.uk@gmail.com"

COPY docker-entrypoint.sh /app/

RUN apk add --no-cache wget curl \
    && mkdir -p /app/firstrun \
    && mkdir -p /app/prerun \
    && chmod +x /app/docker-entrypoint.sh

WORKDIR /app/

entrypoint ["/app/docker-entrypoint.sh"]
