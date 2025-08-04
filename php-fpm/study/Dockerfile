FROM php:8.3-fpm

RUN apt-get update && apt-get install -y \
    git \
    unzip \
    zip \
    libzip-dev \
    libonig-dev \
    supervisor \
    && docker-php-ext-install pdo pdo_mysql zip mbstring \
    && pecl install redis && docker-php-ext-enable redis

RUN mkdir -p /etc/supervisor/conf.d

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

COPY /supervisor/study/php-study.conf /etc/supervisor/conf.d/php-study.conf
COPY /supervisor/study/supervisord.conf /etc/supervisor/supervisord.conf

COPY /php-fpm/study/start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]