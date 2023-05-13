FROM php:8.2-fpm

#
# This project uses the basic mongodb driver (extension).
#
# If you are developing a PHP application with MongoDB, you should consider using
# the MongoDB PHP Library instead.
#
# https://www.mongodb.com/docs/php-library/current/
#

RUN apt update \
    && apt install -qqy libcurl4-openssl-dev libssl-dev \
    && pecl install mongodb \
    && docker-php-ext-enable mongodb;
