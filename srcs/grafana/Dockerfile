# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: memilio <memilio@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/10/24 14:41:55 by memilio           #+#    #+#              #
#    Updated: 2020/10/24 14:41:56 by memilio          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine:latest

RUN		apk add ca-certificates

# Adding library

RUN	wget	-q -O /etc/apk/keys/sgerrand.rsa.pub \
	https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub \
	&&		wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.28-r0/glibc-2.28-r0.apk \
	&&		apk add glibc-2.28-r0.apk

# Install grafana

RUN	wget	https://dl.grafana.com/oss/release/grafana-7.1.5.linux-amd64.tar.gz \
	&&		tar -zxvf grafana-7.1.5.linux-amd64.tar.gz \
	&&		rm -rf grafana-7.1.5.linux-amd64.tar.gz \
	&&		mv /grafana-7.1.5 /grafana

COPY		./srcs/grafana.db /grafana/data/

EXPOSE		3000

WORKDIR		/grafana/bin/

ENTRYPOINT	./grafana-server