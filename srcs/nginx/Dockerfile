# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: memilio <memilio@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/10/16 12:27:39 by memilio           #+#    #+#              #
#    Updated: 2020/10/24 14:46:42 by memilio          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine:latest

RUN		apk update

#Install
RUN		apk add nginx sudo openssh openssl supervisor

#Creating new user and group 'www' for nginx
RUN		adduser -D -g 'www' www

#Create a directory for html files
RUN		mkdir /www
RUN		chown -R www:www /var/lib/nginx
RUN		chown -R www:www /www
RUN		mkdir /run/nginx

#Supervisord conf
COPY	srcs/supervisord.conf /etc/supervisord.conf

#Nginx config and index page
COPY	srcs/nginx.conf /etc/nginx/conf.d/default.conf
COPY	srcs/index.html /var/www/index.html

#Create SSH user
RUN		adduser -D memilio \
		&& echo 'memilio:memilio' | chpasswd \
		&& addgroup memilio wheel \
		&& echo '%wheel ALL=(ALL) ALL' > /etc/sudoers.d/wheel \
		&& /usr/bin/ssh-keygen -A

#Create SSL key
RUN		openssl req -days 365 -newkey rsa:2048  \
		-x509 \
		-sha256 \
		-nodes \
		-out /etc/ssl/certs/certificate.crt \
		-keyout /etc/ssl/certs/key.key \
		-subj '/C=RU/ST=XX/L=XX/O=XX/OU=XX/CN=born2code'

#Listen ports
EXPOSE	80
EXPOSE	443
EXPOSE	22

#Starting
CMD		["usr/bin/supervisord", "-c", "/etc/supervisord.conf"]