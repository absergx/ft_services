FROM alpine:latest

RUN apk add nginx openrc supervisor vim php7 php7-fpm php7-json php7-mysqli \
mysql mysql-client wget && rm /etc/nginx/conf.d/default.conf \
&& rc-update add php-fpm7 default

RUN wget https://wordpress.org/latest.tar.gz \
&& tar -xf latest.tar.gz && rm -rf latest.tar.gz \
&& mv wordpress /var/www/wordpress \
&& chmod 777 /var/www/* && chmod 777 /var/www/wordpress/* \
&& mkdir -p /run/nginx && mkdir -p /run/php

COPY nginx.conf /etc/nginx/conf.d/
COPY	supervisord.conf	/etc/supervisord.conf
COPY wp-config.php /var/www/wordpress
VOLUME /sys/fs/cgroup


EXPOSE 5050

CMD		["usr/bin/supervisord", "-c", "/etc/supervisord.conf"]