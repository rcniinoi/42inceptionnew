#!bin/bash

rm /etc/nginx/sites-enabled/default
rm /etc/nginx/sites-available/default

/etc/init.d/nginx start

exec "$@"