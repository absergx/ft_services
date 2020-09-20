FROM alpine

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
#Config
COPY nginx.conf /etc/nginx/nginx.conf

#Create SSH user
#RUN adduser -D user
#RUN ssh-keygen -a

#Create SSL key
RUN openssl req -days 365 -newkey rsa:2048  \
		-x509 \
		-sha256 \
		-nodes \
		-out /etc/ssl/certs/certificate.crt \
		-keyout /etc/ssl/certs/key.key \
		-subj '/C=RU/ST=XX/L=XX/O=XX/OU=XX/CN=born2code'
EXPOSE 80
EXPOSE 443