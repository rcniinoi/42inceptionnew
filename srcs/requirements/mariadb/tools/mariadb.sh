#!/bin/sh

/etc/init.d/mariadb start

mysql_secure_installation << EOF

Y
Y
$MYSQL_ROOT_PASSWORD
$MYSQL_ROOT_PASSWORD
Y
N
Y
Y
EOF

echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;" | mysql -u root
echo "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" | mysql -u root
echo "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* to $MYSQL_USER@'%';FLUSH PRIVILEGES;" | mysql -u root

exec "$@"