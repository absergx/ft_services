FROM alpine:latest
RUN apk add vim openrc mysql mysql-client

COPY /db.cnf ./etc/mysql/
COPY /start.sh ./
#COPY /wordpress.sql ./

VOLUME	/var/lib/mysql

EXPOSE 3306

ENTRYPOINT ./start.sh