# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: memilio <memilio@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/10/16 12:27:39 by memilio           #+#    #+#              #
#    Updated: 2020/10/23 04:04:35 by memilio          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:latest

RUN apk update

#Install
RUN apk add openrc
RUN apk add openssh
RUN apk add openssl
RUN apk add nginx

#Creating new user and group 'www' for nginx
RUN adduser -D -g 'www' www

#Create a directory for html files
RUN mkdir /www
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www
RUN mkdir /run/nginx

#Supervisord conf
COPY srcs/supervisord.conf /etc

#Nginx config and index page
COPY srcs/nginx.conf /etc/nginx/conf.d/default.conf
COPY srcs/index.html /var/www/index.html

#Create SSH user
# RUN mkdir -p /var/run/sshd
# RUN adduser -D memilio && echo 'memilio:2020' | chpasswd && addgroup memilio wheel
# RUN echo '%wheel ALL=(ALL) ALL' > /etc/sudoers.d/wheel
# RUN ssh-keygen -a

#Create SSL key
RUN openssl req -days 365 -newkey rsa:2048  \
		-x509 \
		-sha256 \
		-nodes \
		-out /etc/ssl/certs/certificate.crt \
		-keyout /etc/ssl/certs/key.key \
		-subj '/C=RU/ST=XX/L=XX/O=XX/OU=XX/CN=born2code'

#Listen ports
EXPOSE 80
EXPOSE 443
EXPOSE 22

#Starting
COPY srcs/start.sh ./start.sh
RUN chmod +x ./start.sh
CMD sh ./start.sh