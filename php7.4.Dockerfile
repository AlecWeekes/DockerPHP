FROM ubuntu:20.04

MAINTAINER Clevertouch DevLabs <devlabs@clever-touch.com>

ARG DEBIAN_FRONTEND=noninteractive

RUN set -xe \
    && apt-get update -yqq \
    && apt-get install git software-properties-common language-pack-en-base curl locales -yqq \
    && add-apt-repository ppa:ondrej/php \
    && apt-get update -yqq \
    && locale-gen en_US.UTF-8

ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN apt-get install php7.4-cli php7.4-fpm php7.4-cgi php7.4-common php7.4-curl php7.4-mbstring php7.4-ldap php7.4-tidy php7.4-xml php7.4-zip php7.4-gd php7.4-mysql php7.4-sqlite3 php7.4-bcmath php7.4-xdebug php7.4-soap -yqq
RUN curl -sS https://getcomposer.org/installer | php
RUN composer.phar /usr/local/bin/composer
