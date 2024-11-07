FROM alpine:3.20

# Cài đặt gói `build-essential` để xây dựng các gói khác
RUN apk add --no-cache build-essential

# Tải xuống và giải nén các gói nguồn PHP 7.0
RUN wget https://dl.php.net/releases/7.0.33/php-7.0.33.tar.gz && tar -xzvf php-7.0.33.tar.gz

# Chuyển đến thư mục nguồn PHP
WORKDIR php-7.0.33

# Cấu hình và cài đặt PHP 7.0
RUN ./configure \
    --prefix=/usr/local \
    --with-config-file=/etc/php/php.ini \
    --with-fpm-user=app \
    --with-fpm-group=app \
    --with-mysqli \
    --with-pdo_mysql \
    --with-gd \
    --with-jpeg \
    --with-png \
    --with-xml \
    --with-mbstring \
    --with-bz2 \
    --with-zlib \
    --with-curl \
    --with-openssl \
    --with-gmp \
    --enable-fpm

RUN make && make install

# Tạo thư mục cho ứng dụng web
RUN mkdir /app

# Sao chép tập tin cấu hình PHP-FPM
COPY /usr/local/etc/php.ini /etc/php/php-fpm.conf

# Chỉnh sửa tập tin cấu hình PHP để phù hợp với Alpine 3.20
RUN sed -i 's=/run/php/php-fpm.sock=/run/php/php-fpm.sock/g' /etc/php/php-fpm.conf

# Xóa thư mục build
RUN rm -rf php-7.0.33

# Sao chép mã ứng dụng vào thư mục web
COPY . /app

# Chuyển đổi người dùng sang "app"
RUN usermod -l app -d /app
RUN chown -R app:app /app

# Khởi động PHP-FPM
CMD ["/usr/local/sbin/php-fpm", "-i", "-d", "error_reporting=24"]
