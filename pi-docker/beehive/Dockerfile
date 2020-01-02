FROM alpine:3.11

ARG BEEHIVE_VERSION

RUN apk update && \
    apk add --no-cache ca-certificates tzdata && \
    update-ca-certificates

RUN wget -O- "https://github.com/muesli/beehive/releases/download/v${BEEHIVE_VERSION}/beehive_${BEEHIVE_VERSION}_Linux_armv6.tar.gz" | tar -xzf - beehive \
 && mv beehive /usr/bin/beehive

# Where the admin interface will be served from
ENV CANONICAL_URL=http://localhost:8181

# Expose the application port
EXPOSE 8181

# create a volume for the configuration persistence
VOLUME /conf

# This form of ENTRYPOINT allows the beehive process to catch signals from the `docker stop` command
ENTRYPOINT /usr/bin/beehive -config /conf/beehive.conf -bind 0.0.0.0:8181 -canonicalurl ${CANONICAL_URL}
