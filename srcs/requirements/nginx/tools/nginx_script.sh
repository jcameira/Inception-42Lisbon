#!/bin/bash
set -e

if [ ! -f /etc/ssl/certs/nginx.crt ]; then
    openssl req -x509 -nodes -days 365 \
        -newkey rsa:2048 \
        -keyout /etc/ssl/private/jcameira.key \
        -out /etc/ssl/certs/jcameira.certs \
        -subj "/C=PT/ST=Lisbon/L=Lisbon/O=42Lisbon/OU=jcameira/CN=jcameira.42.fr"
fi

exec nginx -g "daemon off;"