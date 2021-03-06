FROM php:7.4-fpm-alpine as php

# Set working directory
WORKDIR /var/www/html

# Install Additional dependencies
RUN apk update && apk add --no-cache \
    build-base shadow vim curl \
    php7 \
    php7-fpm \
    php7-common \
    php7-mcrypt \
    php7-mbstring \
    php7-openssl \
    php7-json

# Add workspace UID to www-data
RUN usermod -u ${WORKSPACE_PUID:-1000} www-data

# Copy existing application directory permissions
COPY --chown=www-data:www-data . /var/www/html

# Change current user to www
USER www-data