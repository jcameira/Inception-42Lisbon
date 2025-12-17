FROM debian:bookworm

RUN apt update && apt install -y \
    php8.2-fpm \
    php8.2-mysql \
    php8.2-gd \
    php8.2-mbstring \
    php8.2-xml \
    php8.2-zip \
    curl \
    unzip \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /var/www/html

COPY tools/wordpress_script.sh tmp/wordpress_script.sh
RUN chmod +x tmp/wordpress_script.sh

EXPOSE 9000

ENTRYPOINT ["tmp/wordpress_script.sh"]