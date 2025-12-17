FROM debian:bookworm

RUN apt update && apt install -y \
    mariadb-server \
    mariadb-client \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /run/mysqld \
    && chown -R mysql:mysql /run/mysqld

COPY tools/mariadb_script.sh tmp/mariadb_script.sh
RUN chmod +x tmp/mariadb_script.sh

EXPOSE 3306

ENTRYPOINT ["tmp/mariadb_script.sh"]