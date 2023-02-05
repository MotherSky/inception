#!/bin/sh

#change php-fpm to listen and accepts requests on port 9000 instead of php-fpm.sock
sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf

#download wordpress-cli and put it into our path so we can call it using 'wp'
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
&& mv wp-cli.phar /usr/local/bin/wp && chmod +x /usr/local/bin/wp

#download regular wordpress
wp core download --allow-root

#configure wordpress from wp-cli
wp core config --dbuser=$MYSQL_USER --dbname=$WP_DB_NAME --dbhost=mariadb --dbpass=$MYSQL_PASSWORD --allow-root

#install wordpress from wp-cli
wp core install --url=https://ataleb.42.fr --title='Wordpress' --admin_user=$WP_DB_ADMIN --admin_password=$WP_ADMIN_PASSWORD --admin_email=ataleb@student.1337.ma --allow-root

#add wordpress user from wp-cli
wp user create $WP_DB_USER $WP_USER_EMAIL --user_pass=$WP_USER_PASSWORD --allow-root


#change ownership for redis filesystem
chown -R www-data:www-data /var/www/wordpress

# manually configure redis-cache then install and activate it
sed -i "76i define('WP_REDIS_PORT', 6379);" wp-config.php
sed -i "77i define('WP_REDIS_HOST', 'redis');" wp-config.php
wp plugin install redis-cache --activate --allow-root
wp redis enable --force --allow-root

#finally run php-fpm in foreground to keep the container up
php-fpm7.3 --nodaemonize