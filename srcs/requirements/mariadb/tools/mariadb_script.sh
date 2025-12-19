#!/bin/bash

#IMPORTANT LINE, CAUSES SCRIPT TO EXIT IMMEDIATELY SHOULD ANY LINE FAILS (very useful)
set -e

# If database already exists, do NOT reinitialize
if [ -d "/var/lib/mysql/${MYSQL_DATABASE}" ]; then
    echo "MariaDB already initialized."
else
    echo "Initializing MariaDB..."

    # Start MariaDB server in the background with knowledge of the database files
    mysqld_safe --datadir=/var/lib/mysql &

    # Wait until MariaDB is ready to accept connections
    until mysqladmin ping &>/dev/null; do
        sleep 1
    done

    # -u root -e something just tells me if the root user connects without a password
    if mysql -u root -e "SELECT 1;" &> /dev/null; then
        MYSQL_CMD="mysql -u root"
    else
        MYSQL_CMD="mysql -u root -p${MYSQL_PASSWORD}"
    fi

    # Set root password, create database, create user, grant privileges and updates tables automatically
    # when you modify them
    ${MYSQL_CMD} << EOF
ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};
CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';
FLUSH PRIVILEGES;
EOF

    # Shutdown MariaDB server
    mysqladmin -u root -p${MYSQL_ROOT_PASSWORD} shutdown
fi

exec mysqld_safe --datadir=/var/lib/mysql