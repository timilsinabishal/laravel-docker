FROM php:7-fpm-alpine

Maintainer Bishal Timilsina<bishaltimilsina@gmail.com>

RUN apk add openssl --update-cache

RUN apk add postgresql-dev freetype-dev libpng-dev libjpeg-turbo-dev freetype libpng libjpeg-turbo \
    && docker-php-ext-configure gd \
    --with-gd \
    --with-freetype-dir=/usr/include/ \
    --with-png-dir=/usr/include/ \
    --with-jpeg-dir=/usr/include/ \
 && docker-php-ext-install gd pdo pdo_pgsql mbstring zip

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

workdir /var/www

