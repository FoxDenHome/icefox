#!/bin/sh

mkdir -p /etc/rest-server/ssl && chown root:restserver /etc/rest-server/ssl && chmod 750 /etc/rest-server/ssl

cp /etc/letsencrypt/live/icefox.doridian.net/privkey.pem /etc/rest-server/ssl/key.pem
cp /etc/letsencrypt/live/icefox.doridian.net/fullchain.pem /etc/rest-server/ssl/cert.pem

chown root:restserver /etc/rest-server/ssl/* && chmod 640 /etc/rest-server/ssl/*.pem

systemctl restart rest-server
