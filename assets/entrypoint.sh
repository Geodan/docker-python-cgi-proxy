#!/bin/bash

exec /usr/sbin/apache2ctl -d /etc/apache2 -f apache2.conf -D FOREGROUND

