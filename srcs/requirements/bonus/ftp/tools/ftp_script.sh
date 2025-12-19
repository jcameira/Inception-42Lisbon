#!/bin/bash

if [ ! -f "/etc/vsftpd/vsftpd.conf.bak" ]; then

    mkdir -p /var/www/html

    adduser $FTP_USER --disabled-password

    echo "$FTP_USER:$FTP_PWD" | /usr/sbin/chpasswd
    chown -R "$FTP_USER:$FTP_USER" /var/www/html
    echo "$FTP_USER" | tee -a /etc/vsftpd.userlist 

fi

echo "FTP started on :21"
/usr/sbin/vsftpd /usr/local/bin/vsftpd.conf
