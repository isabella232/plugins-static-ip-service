#!/bin/sh

rm -rf /etc/nginx/.htpasswd
htpasswd -c -m -b /etc/nginx/.htpasswd $PROXY_USER $PROXY_PASSWORD

nginx -g 'daemon off;'
