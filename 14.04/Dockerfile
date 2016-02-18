FROM ubuntu:14.04
MAINTAINER Samuel Taylor "samtaylor.uk@gmail.com"

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections \
    && apt-get update \
    && apt-get install -y -q --no-install-recommends gettext-base wget curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /app/firstrun \
    && mkdir -p /app/prerun

COPY docker-entrypoint.sh /app/
RUN chmod +x /app/docker-entrypoint.sh

WORKDIR /app/

entrypoint ["/app/docker-entrypoint.sh"]