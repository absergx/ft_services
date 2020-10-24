# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: memilio <memilio@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/10/24 13:58:19 by memilio           #+#    #+#              #
#    Updated: 2020/10/24 14:45:21 by memilio          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine:latest
RUN		apk add openrc mysql mysql-client

COPY	srcs/my.cnf ./etc/mysql/
COPY	srcs/start.sh ./
COPY	srcs/wordpress.sql ./

VOLUME	["sys/fs/cgroup"]
VOLUME	["/var/lib"]

EXPOSE	3306

ENTRYPOINT	./start.sh