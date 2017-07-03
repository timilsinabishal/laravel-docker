FROM alpine:latest

LABEL maintainer Bishal Timilsina<bishaltimilsina@gmail.com>

RUN apk --update add curl php7 php7-fpm php7-openssl php7-curl php7-json php7-phar php7-mbstring php7-zip

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

RUN composer global require hirak/prestissimo

RUN mkdir -p /var/www

WORKDIR /var/www

EXPOSE 9000

ENTRYPOINT ["/usr/sbin/php-fpm7"]
