# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: memilio <memilio@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/10/24 13:58:40 by memilio           #+#    #+#              #
#    Updated: 2020/10/24 13:58:41 by memilio          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:latest

RUN		apk update && \
		apk add openrc nginx supervisor mysql mysql-client \
				php7 php7-fpm php7-json php7-mysqli

RUN		rc-update add php-fpm7 default

RUN		mkdir -p /run/nginx
RUN		mkdir -p /var/run/php

RUN		sed -i 's/;daemonize = yes/daemonize = no/g' /etc/php7/php-fpm.conf
RUN		sed -it 's/;   extension=mysql.so/extension=mysql.so/g' /etc/php7/php.ini

COPY	srcs/wordpress.conf		/etc/nginx/conf.d/wordpress.conf
COPY	srcs/supervisord.conf	/etc/supervisord.conf

RUN		wget https://wordpress.org/latest.tar.gz
RUN		tar -xf latest.tar.gz
RUN		rm -rf latest.tar.gz
RUN		mv wordpress /var/www/wordpress

EXPOSE	5050

CMD		["usr/bin/supervisord", "-c", "/etc/supervisord.conf"]