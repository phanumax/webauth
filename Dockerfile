FROM ubuntu:18.04

RUN set -eux; \
  apt-get update; \
  apt-get install -y --no-install-recommends \
  apache2

RUN set -eux; a2enmod \
  proxy \
  proxy_http \
  authnz_ldap

RUN mkdir -p /var/www/html/auth

COPY httpd-default.conf /etc/apache2/sites-available/000-default.conf

EXPOSE 80

CMD ["apachectl","-D","FOREGROUND"]
