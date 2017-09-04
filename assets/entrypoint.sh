#!/bin/bash

echo "ALLOWED_HOSTS = '$ALLOWED_HOSTS'" >> /usr/lib/cgi-bin/myconfig.py

exec /usr/sbin/apache2ctl -d /etc/apache2 -f apache2.conf -D FOREGROUND

