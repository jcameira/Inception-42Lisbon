FROM debian:bookworm

# Install MariaDB server and client if needed for debug
RUN apt-get update && apt-get install -y \
    mariadb-server \
    # mariadb-client \
    && rm -rf /var/lib/apt/lists/*

# /var/lib/mysql - MariaDB data directory
# /var/run/mysqld - MariaDB runtime directory
RUN mkdir -p /var/lib/mysql /var/run/mysqld \
    && chown -R mysql:mysql /var/lib/mysql /var/run/mysqld

# Safer and more reliable
COPY ./tools/mariadb_script.sh /usr/local/bin/mariadb_script.sh

COPY ./tools/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# Give it execution permissions
RUN chmod +x /usr/local/bin/mariadb_script.sh

# Expose the port MariaDB uses INTERNALY - tells Docker that the containter listens on this port at runtime
# DOES NOT bypass Nginx
# DOES NOT publish the port to the host machine
EXPOSE 3306

CMD ["/usr/local/bin/mariadb_script.sh"]