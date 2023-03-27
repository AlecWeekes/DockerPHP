FROM php:7.4-fpm-alpine

MAINTAINER DevLabs <devlabs@clever-touch.com>

ARG DEBIAN_FRONTEND=noninteractive

# Install required extensions
RUN apt-get update && apt-get install -y \
    libicu-dev \
    libxml2-dev \
    libzip-dev \
    libonig-dev \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    unzip \
    && docker-php-ext-install \
        intl \
        pdo_mysql \
        mbstring \
        zip \
        soap \
        bcmath \
        exif \
    && docker-php-ext-enable \
        opcache

ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer
