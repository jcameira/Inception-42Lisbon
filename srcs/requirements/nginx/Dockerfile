FROM debian:bookworm

#Install nginx and openssl
RUN apt -y update && apt install -y \
    nginx \
    openssl \
    && rm -rf /var/lib/apt/lists/*

#Remove default config
RUN rm -f /etc/nginx/sites-enabled/default

#Copy and enable config
COPY conf/default /etc/nginx/sites-available/default

RUN ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/

# Safer and more reliable
COPY tools/nginx_script.sh /usr/local/bin/nginx_script.sh

RUN chmod +x /usr/local/bin/nginx_script.sh

EXPOSE 443

ENTRYPOINT [ "/usr/local/bin/nginx_script.sh" ]