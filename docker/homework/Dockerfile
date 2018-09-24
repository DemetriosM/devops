FROM ubuntu:16.04

RUN apt-get update && apt-get install -y apache2 && a2enmod proxy_balancer && a2enmod proxy_http && a2enmod proxy && a2enmod lbmethod_byrequests

CMD ["apachectl", "-D", "FOREGROUND"]