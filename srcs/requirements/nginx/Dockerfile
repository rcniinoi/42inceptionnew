FROM debian:bullseye

RUN apt-get update && apt-get install -y \
	nginx

COPY ./conf/wordpress.conf /etc/nginx/conf.d/
COPY ./tools/nginx.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/nginx.sh

ENTRYPOINT [ "/usr/local/bin/nginx.sh" ]

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]