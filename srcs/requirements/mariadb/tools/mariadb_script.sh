#!/bin/bash

set -e

# If database already exists, do NOT reinitialize
if [ -d "/var/lib/mysql/${MYSQL_DATABASE}" ]; then
    echo "MariaDB already initialized."
else
    echo "Initializing MariaDB..."

    mysqld_safe --skip-networking &
    pid="$!"

    until mysqladmin ping &>/dev/null; do
        sleep 1
    done

    mysql -u root << EOF
ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};
CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';
FLUSH PRIVILEGES;
EOF

    kill "$pid"
    wait "$pid"
fi

exec mysqld_safe