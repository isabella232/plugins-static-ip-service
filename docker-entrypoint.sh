#!/bin/sh

rm -rf /etc/nginx/.htpasswd
htpasswd -c -m -b /etc/nginx/.htpasswd $PROXY_USER $PROXY_PASSWORD

if [ ! -z "$PROXY_USER_NEW" ]; then
    htpasswd -m -b /etc/nginx/.htpasswd $PROXY_USER_NEW $PROXY_PASSWORD_NEW
fi

nginx -g 'daemon off;'
