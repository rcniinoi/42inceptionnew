FROM debian:bullseye

RUN apt-get update && apt-get install --no-install-recommends -y \
    mariadb-server \
    mariadb-client

RUN mkdir -p /var/run/mysqld && \
	chown -R mysql:mysql /var/run/mysqld && \
	chmod 777 /var/run/mysqld

COPY ./tools/mariadb.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/mariadb.sh

ENTRYPOINT [ "/usr/local/bin/mariadb.sh" ]

EXPOSE 3306

CMD ["mysqld"]