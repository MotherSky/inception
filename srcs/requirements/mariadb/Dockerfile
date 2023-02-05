FROM debian:buster

ARG MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD}
ARG MYSQL_DATABASE=${MYSQL_DATABASE}
ARG MYSQL_USER=${MYSQL_USER}
ARG MYSQL_PASSWORD=${MYSQL_PASSWORD}

#update buster and then install mariadb
RUN apt -y update && apt install -y mariadb-server

RUN sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf

#configure mariadb
RUN service mysql start \
    && mariadb -e "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" \
    && mariadb -e "CREATE DATABASE $MYSQL_DATABASE" \
    && mariadb -e "USE $MYSQL_DATABASE" \
    && mariadb -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';" \
    && mariadb -e "FLUSH PRIVILEGES;" \
    && mariadb -e "ALTER USER root@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';" \
    && mariadb -u root -p$MYSQL_ROOT_PASSWORD -e "FLUSH PRIVILEGES;"

#expose port
EXPOSE 3306

#run daemon to keep mariadb running in foreground
CMD mysqld_safe