FROM php:8.3-fpm

RUN apt-get update && apt-get install -y \
    librdkafka-dev \
    git \
    unzip \
    zip \
    libzip-dev \
    libonig-dev \
    supervisor \
    cron \
    && docker-php-ext-install pdo pdo_mysql zip mbstring \
    && pecl install redis rdkafka && docker-php-ext-enable redis rdkafka

RUN mkdir -p /etc/supervisor/conf.d

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

COPY /supervisor/study/php-study.conf /etc/supervisor/conf.d/php-study.conf
COPY /supervisor/study/supervisord.conf /etc/supervisor/supervisord.conf

RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs \
    && npm install -g npm@latest

COPY /crontab/study/cron /etc/cron.d/php-study
RUN chown root:root /etc/cron.d/php-study \
    && chmod 644 /etc/cron.d/php-study \
    && sed -i 's/\r$//' /etc/cron.d/php-study

COPY /php-fpm/study/start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]