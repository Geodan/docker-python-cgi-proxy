FROM ubuntu:16.04

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    # use "--no-install-recommends" to skip installation of unnecessary stuff like "isc-dhcp-client"
    apt-get install -y --no-install-recommends apache2  && \
    apt-get install -y ca-certificates ca-certificates python && \
    rm -rf /var/lib/apt/lists/*

RUN a2enmod cgi

COPY assets/proxy.cgi /usr/lib/cgi-bin/proxy.cgi
COPY assets/entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
