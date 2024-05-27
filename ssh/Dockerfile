FROM alpine

MAINTAINER VooThanh DEV <voothanhdev@gmail.com>

COPY ./entrypoint /

RUN apk update \
    && apk add openssh sshpass \
    && adduser -G www-data -D -u 1000 -s /bin/sh www \
    && mkdir -p /home/www/.ssh/pems \
    && mkdir -p /home/www/bin \
    && chown -R www:www-data /home/www/.ssh /home/www/.ssh/pems /home/www/bin \
    && chmod +x /entrypoint \
    && echo "export PATH=\"/home/www/bin:\$PATH\"" >> /home/www/.profile \
    && rm -rf /tmp/* /var/cache/* /var/lib/apk/* /var/log/* /var/tmp/*

USER www

ENTRYPOINT ["/entrypoint"]
CMD ["tail", "-f", "/dev/null"]