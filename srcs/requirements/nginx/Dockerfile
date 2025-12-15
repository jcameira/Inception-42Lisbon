FROM debian:Bookworm

RUN apt -y update; apt install -y nginx openssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/private/jcameira.key \
    -out /etc/ssl/certs/jcameira.crt \
    -subj "/C=PT/ST=Lisbon/L=Lisbon/O=42Lisbon/OU=jcameira/CN=jcameira.42.fr"

COPY ./tools/nginx_script.sh ./tmp/nginx_script.sh

RUN chmod +x ./tmp/nginx_script.sh

COPY ./conf/default /etc/nginx/sites-available/default

CMD [ "./tmp/nginx_script.sh" ]