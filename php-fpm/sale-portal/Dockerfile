FROM php:8.3-fpm

RUN apt-get update && apt-get install -y \
    librdkafka-dev \
    git \
    unzip \
    zip \
    libjpeg-dev \
    libpng-dev \
    libfreetype6-dev \
    libzip-dev \
    libonig-dev \
    supervisor \
    libssl-dev \
    pkg-config \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install pdo pdo_mysql zip mbstring gd bcmath pcntl\
    && pecl install redis rdkafka mongodb-1.21.1 \
    && docker-php-ext-enable redis rdkafka mongodb

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs \
    && npm install -g npm@latest

