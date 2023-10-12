#!bin/bash

/etc/init.d/php7.4-fpm start

wget https://wordpress.org/latest.tar.gz
tar -xzvf latest.tar.gz -C /var/www/html
chown -R www-data.www-data /var/www/html/wordpress
chmod -R 755 /var/www/html/wordpress

exec "$@"