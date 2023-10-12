FROM debian:bullseye

RUN apt-get update && apt-get install -y \
    wget \
    php \
	php-cgi \
	php-mysql \
	php-fpm \
	php-pdo \
	php-gd \
	php-cli \
	php-mbstring

COPY ./tools/wordpress.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/wordpress.sh

ENTRYPOINT [ "/usr/local/bin/wordpress.sh" ]

EXPOSE 9000