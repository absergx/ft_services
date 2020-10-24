# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: memilio <memilio@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/10/24 13:58:34 by memilio           #+#    #+#              #
#    Updated: 2020/10/24 14:45:35 by memilio          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine:latest

RUN		apk add vim openrc openssl supervisor nginx php7 php7-fpm php7-iconv \
		php7-json php7-mbstring php7-mysqli php7-phar php7-session
RUN		rc-update add php-fpm7 default

COPY	./srcs/supervisord.conf /
COPY	./srcs/nginx.conf /
COPY	./srcs/config.inc.php /

RUN		wget -c https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-english.tar.xz
RUN		mkdir -p /var/www/phpmyadmin /var/www/phpmyadmin/tmp
RUN		chmod 777 /var/www/phpmyadmin/tmp
RUN		tar -xvf phpMyAdmin-latest-english.tar.xz --strip-components 1 -C \
		/var/www/phpmyadmin

RUN		rm -f /etc/nginx/conf.d/default.conf
RUN		mv /nginx.conf /etc/nginx/conf.d/
RUN		mv /config.inc.php /var/www/phpmyadmin/
RUN		mv /supervisord.conf /etc/supervisord.conf
RUN		mkdir /run/nginx /var/run/php

EXPOSE	5000

CMD		["usr/bin/supervisord", "-c", "/etc/supervisord.conf"]