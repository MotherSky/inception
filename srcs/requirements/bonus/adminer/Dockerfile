FROM debian:buster

RUN apt -y update && apt install -y wget php
RUN mkdir /var/www/wordpress -p

COPY ./adminer.sh /
RUN chmod +x /adminer.sh

CMD ["/adminer.sh"]