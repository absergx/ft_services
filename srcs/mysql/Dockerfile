FROM alpine:latest
RUN apk add openrc mysql mysql-client

COPY srcs/db.cnf ./etc/mysql/
COPY srcs/start.sh ./
COPY srcs/wordpress.sql ./

VOLUME	["sys/fs/cgroup"]
VOLUME	["/var/lib"]

EXPOSE 3306

ENTRYPOINT ./start.sh