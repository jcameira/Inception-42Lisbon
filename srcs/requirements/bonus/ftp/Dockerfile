FROM debian:bookworm

RUN apt-get update && apt-get install -y \
    vsftpd \
    && rm -rf /var/lib/apt/lists/*

# Safer and more reliable
COPY ./tools/ftp_script.sh /usr/local/bin/ftp_script.sh

COPY ./conf/vsftpd.conf /usr/local/bin/vsftpd.conf

RUN chmod +x /usr/local/bin/ftp_script.sh

CMD ["/usr/local/bin/ftp_script.sh"]