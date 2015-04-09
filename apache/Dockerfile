FROM ubuntu:14.04
MAINTAINER Bharat Akkinepalli <bharatak@thoughtworks.com>

RUN apt-get -yqq update
RUN apt-get -yqq install apache2
RUN a2enmod ssl
RUN a2enmod cache
RUN a2enmod cache_disk
RUN a2enmod rewrite
RUN a2enmod headers
RUN a2enmod proxy_http

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid
ENV APACHE_RUN_DIR /var/run/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2

RUN mkdir -p $APACHE_RUN_DIR $APACHE_LOCK_DIR $APACHE_LOG_DIR
RUN chown -R root:root /var/www
ADD ssl.conf /etc/apache2/mods-enabled/ssl.conf
ADD localhost.crt /etc/ssl/certs/localhost.crt
RUN chown root:ssl-cert /etc/ssl/certs/localhost.crt
ADD localhost.key /etc/ssl/private/localhost.key
RUN chown root:root /etc/ssl/private/localhost.key

WORKDIR /var/www


EXPOSE 443
VOLUME [ "/var/www/bahmni_config" ]
VOLUME [ "/var/www/bahmniapps" ]

ENTRYPOINT [ "/usr/sbin/apache2" ]

CMD ["-D", "FOREGROUND"]

