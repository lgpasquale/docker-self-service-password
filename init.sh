#!/bin/sh

if [ -z "${SSP_SERVER_NAME}" ]; then
    sed -i "s/\([[:space:]]*ServerName\).*/\1 ${SSP_SERVER_NAME}/g" /etc/apache2/sites-available/self-service-password.conf
    sed -i "s/\([[:space:]]*ServerName\).*/\1 ${SSP_SERVER_NAME}/g" /etc/apache2/sites-available/self-service-password-ssl.conf
fi

if [ -z "${SSP_SERVER_ALIAS}" ]; then
    sed -i "s/\([[:space:]]*ServerAlias\).*/\1 ${SSP_SERVER_ALIAS}/g" /etc/apache2/sites-available/self-service-password.conf
    sed -i "s/\([[:space:]]*ServerAlias\).*/\1 ${SSP_SERVER_ALIAS}/g" /etc/apache2/sites-available/self-service-password-ssl.conf
fi

/usr/sbin/apache2ctl -D FOREGROUND


