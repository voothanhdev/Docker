FROM nginx:alpine

LABEL maintainer="<voothanhdev@gmail.com>"
LABEL author.email="<voothanhdev@gmail.com>"
LABEL author.name="VooThanh DEV"

ENV SERVER_NAME=local.io
ENV APP_DIR=/app
ENV VARNISH_PORT=6081
ENV HTTPS=true
ENV PROXY_PORT=3000
ENV PHP_PORT=9000

COPY include/ /etc/nginx/include/
COPY config/*.conf /etc/nginx/conf.d/
COPY bin/* /usr/local/bin/
COPY entrypoint /

RUN apk update && \
    apk --no-cache add bash openssl
RUN adduser -G www-data -D -u 1000 -s /bin/bash www \
    && touch /var/run/nginx.pid \
    && mkdir -p ${APP_DIR} /sock \
    && mv -f /etc/nginx/include/nginx.conf /etc/nginx/nginx.conf \
    && chown -R www:www-data ${APP_DIR} /etc/nginx /var/cache/nginx /var/run/nginx.pid /var/log/nginx /sock /entrypoint \
    && chmod +x /entrypoint /usr/local/bin/* \
    && rm -f /etc/nginx/conf.d/default.conf \
    && rm -rf /var/cache/apk/*

WORKDIR ${APP_DIR}

ENTRYPOINT ["/entrypoint"]

EXPOSE 443 80

USER www