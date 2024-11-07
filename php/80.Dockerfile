ARG VERSION=8.0

FROM php:${VERSION}-fpm-alpine

LABEL maintainer="<voothanhdev@gmail.com>"
LABEL author.email="<voothanhdev@gmail.com>"
LABEL author.name="VooThanh DEV"

# Update local file
COPY ini/* /usr/local/etc/php/conf.d/
COPY pool/* /usr/local/etc/php-fpm.d/
COPY bin/* /usr/local/bin/
# Entrypoint
COPY entrypoint /

# Update and add install
RUN apk update && \
    apk --no-cache add openldap-dev \
            rabbitmq-c-dev \
            jpeg-dev \
            krb5-dev \
            freetype-dev \
            bzip2-dev \
            zlib-dev \
            libpng-dev \
            gettext-dev \
            gmp-dev \
            imap-dev \
            icu-dev \
            aspell-dev \
            libxml2-dev \
            tidyhtml-dev \
            libxslt-dev \
            libzip-dev \
            openssl-dev \
            iproute2 \
            linux-headers \
            autoconf \
            build-base \
            bash

# Create user www
RUN addgroup -g 1000 www; adduser -G www -D -u 1000 -s /bin/sh www;

# Configure the ext library
RUN docker-php-ext-configure gd --with-jpeg=/usr/include/ --with-freetype=/usr/include/;
RUN docker-php-ext-configure opcache --enable-opcache;

# Install extensions
RUN docker-php-ext-install -j$(nproc) \
                                bcmath \
                                bz2 \
                                calendar \
                                exif \
                                gd \
                                gettext \
                                gmp \
                                imap \
                                intl \
                                ldap \
                                mysqli \
                                opcache \
                                pdo_mysql \
                                pspell \
                                shmop \
                                soap \
                                sockets \
                                sysvmsg \
                                sysvsem \
                                sysvshm \
                                tidy \
                                xsl \
                                pcntl \
                                zip;
RUN pecl install -o -f xmlrpc xdebug-3.2.0 redis amqp;
RUN rm /usr/local/etc/php/conf.d/z-xdebug.ini; docker-php-ext-enable xmlrpc redis xdebug amqp;

# Install n98
RUN curl -o m2 https://files.magerun.net/n98-magerun2.phar; chmod +x m2 && mv m2 /usr/bin/m2;
# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install mailhog
RUN curl -sSLO https://github.com/mailhog/mhsendmail/releases/download/v0.2.0/mhsendmail_linux_amd64 \
    && chmod +x mhsendmail_linux_amd64 \
    && mv mhsendmail_linux_amd64 /usr/local/bin/mhsendmail
# Update permission file
RUN sed -i -e 's/home\/www:\/bin\/sh/home\/www:\/bin\/bash/g' /etc/passwd \
    && sed -i -e 's/^zend_extension/\;zend_extension/g' /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && mkdir /project /sock \
    && chmod +x /entrypoint \
    && chown -R www:www /project /sock /usr/local/etc/php/conf.d /usr/local/etc/php-fpm.d /entrypoint \
    && rm -rf /tmp/* /var/cache/* /var/lib/apk/* /var/log/* /var/tmp/*

ENTRYPOINT ["/entrypoint"]

WORKDIR /project

USER www

EXPOSE 9000

CMD ["php-fpm", "-R"]
