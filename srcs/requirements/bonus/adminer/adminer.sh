#!/bin/sh

#wget adminer file and put it in /var/www/wordpress/
wget https://www.adminer.org/latest.php -O /var/www/wordpress/adminer.php

#run php server in foreground
php -S 0.0.0.0:8000 