FROM alpine:latest

# Environment

ENV FTB_MODPACK_ID=0
ENV FTB_MODPACK_VERSION_ID=0

ENV ACCEPT_MOJANG_EULA=1

ENV JAVA_MEMORY_MIN=4096M
ENV JAVA_MEMORY_MAX=6144M

# Set up runtime dependencies

RUN set -eux; \
    # dpkg --add-architecture amd64 ; \
    apk update && \
    apk add \
    ca-certificates \
    curl \
    jq \
    bash \
    # libc6:amd64 \
    # libgcc1 \
    ;
# rm -rf /var/lib/apt/lists/*

# Set up container user

RUN set -eux; \
    addgroup --gid 99 --system minecraft; \
    adduser \
    --ingroup minecraft \
    --home /var/lib/minecraft \
    --no-create-home \
    --system \
    --uid 99 \
    minecraft \
    ; \
    mkdir /var/lib/minecraft; \
    chown minecraft:minecraft /var/lib/minecraft

# Entrypoint config

STOPSIGNAL SIGINT

COPY docker-entrypoint.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# ENTRYPOINT ["docker-entrypoint.sh"]
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]

WORKDIR /var/lib/minecraft

CMD ["/var/lib/minecraft/start.sh"]