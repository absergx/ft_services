# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: memilio <memilio@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/10/16 12:27:25 by memilio           #+#    #+#              #
#    Updated: 2020/10/16 12:28:02 by memilio          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.7

RUN apk update && apk add openssl vsftpd openrc	
RUN openssl req -x509 -nodes -days 365 -newkey rsa:1024 -subj \
/C=RU/ST=Kazan/L=Kazan/O=School21/OU=Memilio/CN=localhost/emailAddress=memilio@student.21-school.ru \
-keyout /etc/vsftpd/vsftpd.pem -out /etc/vsftpd/vsftpd.pem
RUN echo 'root:root' | chpasswd
VOLUME ["sys/fs/cgroup"]
COPY srcs/vsftpd.conf /etc/vsftpd/vsftpd.conf
RUN mkdir -p /var/log/ftp && touch /var/log/ftp/xferlog
RUN rc default
EXPOSE 21
ENTRYPOINT vsftpd /etc/vsftpd/vsftpd.conf