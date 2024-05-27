ARG VERSION=14
ARG ALPINE=3.14

FROM node:${VERSION}-alpine${ALPINE}

MAINTAINER VooThanh DEV <voothanhdev@gmail.com>

ENV ROOT_FOLDER /project

RUN apk update && \
    apk add autoconf \
            automake \
            make \
            nasm \
            file \
            libtool \
            libjpeg \
            zlib-dev \
            libpng-dev \
    && rm -rf /tmp/* /var/cache/* /var/lib/apk/* /var/log/* /var/tmp/*
RUN mkdir -p ${ROOT_FOLDER} \
    && mkdir -p /usr/local/lib/node_modules \
    && chown -R 1000:1000 "${ROOT_FOLDER}" /usr/local/lib/node_modules /usr/local/bin \
    && chmod -R 0777 "${ROOT_FOLDER}"

WORKDIR ${ROOT_FOLDER}

USER 1000

CMD ["node"]