#!/bin/sh

if [ -f ./wp-config.php ]
then
	echo "wordpress already downloaded"
else
env
wget http://wordpress.org/latest.tar.gz
tar -xpvf latest.tar.gz
mv wordpress/* .
rm -rf latest.tar.gz
rm -rf wordpress
	# ls -la
	# sleep 10
	cp wp-config-sample.php wp-config.php
	# chown -x root:root wp-config.php

# sed -i "s/username_here/$MYSQL_USER/g" wp-config.php
# sed -i "s/password_here/$MYSQL_PASSWORD/g" wp-config.php
# sed -i "s/localhost/$MYSQL_DATABASE_HOST/g" wp-config.php
# sed -i "s/database_name_here/$MYSQL_DATABASE/g" wp-config.php
wp config set DB_USER $MYSQL_USER --allow-root
wp config set DB_PASSWORD $MYSQL_PASSWORD --allow-root
wp config set DB_HOST $MYSQL_DATABASE_HOST --allow-root
wp config set DB_NAME $MYSQL_DATABASE --allow-root

wp user create $WORDPRESS_ADMIN_USER $WORDPRESS_ADMIN_EMAIL --role=administrator --user_pass=$WORDPRESS_ADMIN_PASSWORD --allow-root
wp user create $WORDPRESS_USER $WORDPRESS_USER_EMAIL --role=author --user_pass=$WORDPRESS_USER_PASSWORD --allow-root

fi

exec "$@"


