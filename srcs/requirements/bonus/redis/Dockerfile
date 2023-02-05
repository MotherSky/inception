FROM debian:buster

RUN apt -y update && apt install -y redis-server php-redis

EXPOSE 6379

CMD ["redis-server", "--protected-mode" , "no"]