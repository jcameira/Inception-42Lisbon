FROM debian:bookworm

# Install PHP-FPM and extensions
RUN apt update && apt install -y \
    php8.2-fpm \
    php8.2-mysql \
    php8.2-mysqli \
    php8.2-gd \
    php8.2-mbstring \
    php8.2-xml \
    php8.2-zip \
    php8.2-redis \
    mariadb-client \
    curl \
    unzip \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    && rm -rf /var/lib/apt/lists/*

# 
WORKDIR /var/www/html

# Safer and more reliable
COPY tools/wordpress_script.sh /usr/local/bin/wordpress_script.sh

COPY tools/wp-config.php /usr/local/bin/wp-config.php

# Give it execution permissions
RUN chmod +x /usr/local/bin/wordpress_script.sh

# Expose the port PHP-FPM uses INTERNALY - tells Docker that the containter listens on this port at runtime
# DOES NOT bypass Nginx
# DOES NOT publish the port to the host machine
EXPOSE 9000

CMD ["/usr/local/bin/wordpress_script.sh"]