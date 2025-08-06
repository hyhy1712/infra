#!/bin/bash

mkdir -p /var/www/study/storage/logs /var/www/study/bootstrap/cache

chown -R www-data:www-data /var/www/study/storage /var/www/study/bootstrap/cache
chmod -R 775 /var/www/study/storage /var/www/study/bootstrap/cache

/usr/bin/supervisord -c /etc/supervisor/supervisord.conf &

php-fpm