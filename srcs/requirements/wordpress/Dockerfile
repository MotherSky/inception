FROM debian:buster

#ARGS for env

ARG WORDPRESS_DB_NAME=${WORDPRESS_DB_NAME}
ARG WP_DB_ADMIN=${WP_DB_ADMIN}
ARG WP_ADMIN_PASSWORD=${WP_ADMIN_PASSWORD}
ARG WP_DB_USER=${WP_DB_USER}
ARG WP_USER_PASSWORD=${WP_USER_PASSWORD}
ARG WP_USER_EMAIL=${WP_USER_EMAIL}

#Install dependencies for php-fpm and wordpress

RUN apt -y update && apt -y install curl php-fpm mariadb-client php-common php-mysql \
    php-xml php-xmlrpc php-curl php-gd \
    php-imagick php-cli php-dev php-imap \
    php-mbstring php-opcache php-redis \
    php-soap php-zip \
    && service php7.3-fpm start


WORKDIR /var/www/wordpress

#Copy config script and run it

COPY ./tools/config.sh /var/www/wordpress/config.sh
RUN chmod +x config.sh
CMD ["/var/www/wordpress/config.sh"]