FROM debian:bullseye

RUN apt-get update && apt-get install --no-install-recommends -y mariadb-server

EXPOSE 3306

CMD ["mariadbd"]