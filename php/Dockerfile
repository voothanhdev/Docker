ARG VERSION=8.0

FROM golang:alpine AS mailhog

RUN go install github.com/mailhog/mhsendmail@latest && \
    chmod +x /go/bin/mhsendmail

FROM php:${VERSION}-fpm-alpine AS builder

ARG VERSION

COPY ini/* /usr/local/etc/php/conf.d/
COPY build/* /usr/local/bin/

# Update and add install
RUN apk add --no-cache --virtual .build-deps \
        $PHPIZE_DEPS \
        autoconf \
        linux-headers \
        gcc \
        g++ \
        make \
        libtool \
        bison \
        re2c \
        coreutils \
        curl-dev \
        openldap-dev \
        gmp-dev \
        imap-dev \
        icu-dev \
        zlib-dev \
        libxml2-dev \
        bzip2-dev \
        gettext-dev \
        libpng-dev \
        freetype-dev \
        libjpeg-turbo-dev \
        tidyhtml-dev \
        libxslt-dev \
        pcre-dev \
        aspell-dev \
        libmcrypt-dev \
        recode-dev \
        krb5-dev \
        sqlite-dev \
        libzip-dev \
        recode-dev \
        rabbitmq-c-dev \
    && chmod +x /usr/local/bin/*

# Install extensions
RUN /usr/local/bin/ext-configuration \
    && docker-php-ext-install -j$(nproc) \
                                bcmath \
                                bz2 \
                                calendar \
                                exif \
                                gd \
                                gettext \
                                gmp \
                                intl \
                                ldap \
                                mysqli \
                                opcache \
                                pdo_mysql \
                                shmop \
                                soap \
                                sockets \
                                sysvmsg \
                                sysvsem \
                                sysvshm \
                                tidy \
                                xsl \
                                pcntl \
                                zip \
    && /usr/local/bin/install-imap \
    && /usr/local/bin/install-pspell \
    && /usr/local/bin/install-recode \
    && /usr/local/bin/install-xmlrpc \
    && /usr/local/bin/install-redis \
    && /usr/local/bin/install-amqp \
    && /usr/local/bin/install-xdebug

FROM php:${VERSION}-fpm-alpine

LABEL maintainer="<voothanhdev@gmail.com>"
LABEL author.email="<voothanhdev@gmail.com>"
LABEL author.name="VooThanh DEV"

ENV APP_DIR=/app
ENV MAILHOG_ADDR="mailhog:1025"

# Update local file
COPY pool/* /usr/local/etc/php-fpm.d/
COPY bin/* /usr/local/bin/
# Copy mhsendmail from the builder stage
COPY --from=mailhog /go/bin/mhsendmail /usr/local/bin/mhsendmail
COPY --from=builder /usr/local/lib/php/extensions/ /usr/local/lib/php/extensions/
COPY --from=builder /usr/local/etc/php/conf.d/ /usr/local/etc/php/conf.d/
# Entrypoint
COPY entrypoint /

RUN apk add --no-cache \
        bash \
        unzip \
        libintl \
        tidyhtml \
        libjpeg \
        libpng \
        freetype \
        icu \
        gmp \
        aspell \
        openldap \
        libxslt \
        libzip \
        libmcrypt \
        zlib \
        bzip2 \
        libxml2 \
        gettext \
        krb5 \
        sqlite-libs \
        curl \
        openssl \
        rabbitmq-c

# Create user www
RUN addgroup -g 1000 www; adduser -G www -D -u 1000 -s /bin/sh www;

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Update permission file
RUN sed -i -e 's/home\/www:\/bin\/sh/home\/www:\/bin\/bash/g' /etc/passwd \
    && mkdir ${APP_DIR} /sock \
    && chmod +x /entrypoint \
    && chown -R www:www ${APP_DIR} /sock /usr/local/etc/php/conf.d /usr/local/etc/php-fpm.d /entrypoint

ENTRYPOINT ["/entrypoint"]

WORKDIR ${APP_DIR}

USER www

EXPOSE 9000

CMD ["php-fpm", "-R"]
