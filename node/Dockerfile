ARG VERSION=14
ARG ALPINE=3.14

FROM node:${VERSION}-alpine${ALPINE}

LABEL maintainer="<voothanhdev@gmail.com>"
LABEL author.email="<voothanhdev@gmail.com>"
LABEL author.name="VooThanh DEV"

ENV APP_DIR=/app

RUN apk update && \
    apk --no-cache add \
        python3 \
        make \
        g++ \
        autoconf \
        automake \
        libtool \
        nasm \
        file \
        libjpeg \
        zlib \
        libpng \
    && rm -rf /tmp/* /var/cache/* /var/lib/apk/* /var/log/* /var/tmp/*
RUN mkdir -p ${APP_DIR} && chown -R node:node "${APP_DIR}"

WORKDIR ${APP_DIR}

CMD ["node"]