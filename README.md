# docker-python-cgi-proxy
Simple Python proxy wrapped in an Apache CGI script that can be used to do proxy requests (e.g. for XHR requests in order to prevent cross-origin problems). The script can only proxy requests to allow hosts.

## Usage
Run the container with the environment var ```ALLOWED_HOSTS``` in order to set hosts which can be proxied. The variable expects a *String* of FQDN (no port numers or protocols are supported) separated by colons (```:```). The script is located under ```/proxy.cgi```.

e.g.

    docker run -d --name=proxy -p 8080:80 -e "ALLOWED_HOSTS=services.geodan.nl:acc.geodan.nl" quay.io/geodannl/python-cgi-proxy:latest
    
then go to http://docker-host-ip:8080/proxy.cgi?url=https://services.geodan.nl/docs/api/schema/geoquest_service.json

## Development
Builds are automatically triggered on https://quay.io/repository/geodannl/python-cgi-proxy?tab=info after changes in this Git repository.
