FROM debian:bullseye

RUN apt update && apt upgrade && apt install -y wget vim

EXPOSE 443
EXPOSE 80
CMD ["sleep", "infinity"]
