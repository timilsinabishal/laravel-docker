FROM php:7-fpm-alpine

LABEL maintainer Bishal Timilsina<bishaltimilsina@gmail.com>

RUN  apk add --update git postgresql-dev && \
    docker-php-ext-install pdo pdo_pgsql mbstring zip && rm /var/cache/apk/*

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

RUN composer global require hirak/prestissimo

workdir /var/www
