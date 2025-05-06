FROM nginx:alpine

LABEL maintainer="<voothanhdev@gmail.com>"
LABEL author.email="<voothanhdev@gmail.com>"
LABEL author.name="VooThanh DEV"

ENV APP_DIR=/app

COPY include/ /etc/nginx/include/
COPY config/*.conf /etc/nginx/conf.d/
COPY bin/* /usr/local/bin/
COPY entrypoint /

RUN apk update && \
    apk --no-cache add bash openssl
RUN adduser -G www-data -D -u 1000 -s /bin/bash www \
    && touch /var/run/nginx.pid \
    && mkdir -p ${APP_DIR} \
    && mv -f /etc/nginx/include/nginx.conf /etc/nginx/nginx.conf \
    && chown -R www:www-data ${APP_DIR} \
    && chmod +x /entrypoint /usr/local/bin/* \
    && rm -f /etc/nginx/conf.d/default.conf \
    && rm -rf /var/cache/apk/*

WORKDIR ${APP_DIR}

ENTRYPOINT ["/entrypoint"]

EXPOSE 443 80