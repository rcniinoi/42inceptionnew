FROM debian:bullseye

RUN apt-get update && apt-get install --no-install-recommends -y \
	nginx \
	openssl

# make directory for nginx cert
RUN mkdir -p /etc/nginx/cert

# -keyout : private key
# -out : cert.crt (.key + .cer)
# -subj : setting
# RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
# 	-keyout /etc/nginx/cert/pmikada.key \
# 	-out /etc/nginx/cert/pmikada.crt \
# 	-subj "/C=TH/ST=Bangkok/L=Bangkok/O=42Bangkok/OU=pmikada/CN=pmikada.42.fr"

# COPY ./conf/nginx.conf /etc/nginx/conf.d

CMD ["nginx", "-g", "daemon off;"]