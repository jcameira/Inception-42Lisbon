#!/bin/bash

# create directory to use in nginx container later and also to setup the wordpress conf
mkdir -p /var/www/html

chown -R root:root /var/www/html

chmod -R 755 /var/www/html

cd /var/www/html

rm -rf *

#download wp-cli, a tool for managing wordpress through a command line interface
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

#give executable rights to wp-cli.phar
chmod +x wp-cli.phar

#move it into system path for global use of "wp"
mv wp-cli.phar /usr/local/bin/wp

#download wordpress using wp-cli
wp core download --path=/var/www/html --allow-root

#copy the default sample config to a real config file
cp /usr/local/bin/wp-config.php /var/www/html/wp-config.php

#wait until mariadb is ready to accept connections
until mysqladmin ping -h"mariadb" -u"$MYSQL_USER" -p"$MYSQL_PASSWORD" --silent; do
    sleep 1
done

if ! wp core is-installed --allow-root; then
    wp core install --url=${DOMAIN_NAME}/ --title=${WP_TITLE} --admin_user=${WP_ADMIN_USER} \
        --admin_password=${WP_ADMIN_PWD} --admin_email=${WP_ADMIN_EMAIL} --allow-root

    wp user create "${WP_USER}" "${WP_EMAIL}" --role=author --user_pass="${WP_PWD}" --allow-root
fi

#install the Redis object cache plugin
wp plugin install redis-cache --activate --allow-root

#update all plugins to current latest version
wp plugin update --all --allow-root

#modifies PHP-FPM to listen on tcp port 9000
sed -i 's/listen = \/run\/php\/php8.2-fpm.sock/listen = 9000/g' /etc/php/8.2/fpm/pool.d/www.conf

#test for runtime directory, creates it if it doesn't exist (it should exist already)
mkdir -p /run/php

#enables redis
wp redis enable --allow-root

exec php-fpm8.2 -F