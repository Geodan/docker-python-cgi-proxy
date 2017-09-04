FROM ubuntu:16.04

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    # use "--no-install-recommends" to skip installation of unnecessary stuff like "isc-dhcp-client"
    apt-get install -y --no-install-recommends apache2  && \
    apt-get install -y ca-certificates ca-certificates python phppgadmin && \
    rm -rf /var/lib/apt/lists/*

# allow connections to phpPgAdmin from everywhere
RUN perl -i -0pe 's/# Only allow connections from localhost:\nRequire local/Allow from all/' /etc/apache2/conf-enabled/phppgadmin.conf

RUN a2enmod cgi

COPY assets/proxy.cgi /usr/lib/cgi-bin/proxy.cgi
COPY assets/entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

