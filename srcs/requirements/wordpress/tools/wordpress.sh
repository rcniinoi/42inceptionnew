#!bin/bash

/etc/init.d/php7.4-fpm start

wget -O /tmp/wordpress.tar.gz https://wordpress.org/latest.tar.gz
mkdir -p /var/www/html/wordpress
tar -xzvf /tmp/wordpress.tar.gz -C /var/www/html
chown -R www-data.www-data /var/www/html/wordpress
chmod -R 755 /var/www/html/wordpress

exec "$@"