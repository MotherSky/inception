FROM debian:buster

#update buster and then install nginx
RUN apt -y update && apt -y install nginx && apt -y install openssl

#generate self signed certificat
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/selfsigned-nginx.key -out /etc/ssl/certs/selfsigned-nginx.crt -batch

#copy default configuration file
COPY conf/default /etc/nginx/sites-available/default

#expose port 443
EXPOSE 443

#run nginx while setting global directive to daemon off
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]