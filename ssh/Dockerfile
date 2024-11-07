FROM alpine:3.15

LABEL maintainer="<voothanhdev@gmail.com>"
LABEL author.email="<voothanhdev@gmail.com>"
LABEL author.name="VooThanh DEV"

COPY ./entrypoint /

RUN apk update \
    && apk --no-cache add openssh \
    && adduser -G www-data -D -u 1000 -s /bin/sh www \
    && mkdir -p /home/www/bin \
    && mkdir -p /home/www/.ssh \
    && chown -R www:www-data /home/www/.ssh /home/www/bin \
    && chmod +x /entrypoint \
    && echo "export PATH=\"/home/www/bin:\$PATH\"" >> /home/www/.profile \
    && rm -rf /tmp/* /var/cache/* /var/lib/apk/* /var/log/* /var/tmp/* /etc/apk/cache/*

USER www

ENTRYPOINT ["/entrypoint"]
CMD ["tail", "-f", "/dev/null"]