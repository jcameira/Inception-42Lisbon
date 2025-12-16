#!/bin/bash

set -e

if [ ! -f "index.php" ]; then
    echo "Downloading WordPress..."
    curl -o wordpress.tar.gz https://wordpress.org/latest.tar.gz
    tar -xzf wordpress.tar.gz --strip-components=1
    rm wordpress.tar.gz
    chown -R www-data:www-data /var/www/html
fi

exec php-fpm8.2 -F