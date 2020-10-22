#!/bin/sh

function emergency_exit {
	echo "\n\033[38;5;160mSomething goes wrong! Build stopped.\n\033[0m"
	minikube delete
	exit 1
}

minikube start --vm-driver=virtualbox
eval $(minikube docker-env) > /dev/null

minikube addons enable metallb

# apply metallb and volume confings
kubectl apply -f srcs/yamls/metallb.yaml
kubectl apply -f srcs/yamls/volume.yaml

# build images for services
docker build srcs/nginx -t "nginx-image"			|| emergency_exit
docker build srcs/phpmyadmin -t "phpmyadmin-image"	|| emergency_exit
docker build srcs/mysql -t "mysql-image"			|| emergency_exit
docker build srcs/wordpress -t "wordpress-image"	|| emergency_exit
docker build srcs/ftps -t "ftps-image"				|| emergency_exit
docker build srcs/influx -t "influx-image"			|| emergency_exit
docker build srcs/grafana -t "grafana-image"		|| emergency_exit

# apply k8s configs to services
kubectl apply -f srcs/yamls/nginx.yaml				|| emergency_exit
kubectl apply -f srcs/yamls/phpmyadmin.yaml			|| emergency_exit
kubectl apply -f srcs/yamls/mysql.yaml				|| emergency_exit
kubectl apply -f srcs/yamls/wordpress.yaml			|| emergency_exit
kubectl apply -f srcs/yamls/ftps.yaml				|| emergency_exit
kubectl apply -f srcs/yamls/influx.yaml				|| emergency_exit
kubectl apply -f srcs/yamls/grafana.yaml			|| emergency_exit

echo "\n\033[38;5;46mBuild success! Now you can use followed services:"
echo "Ip address nginx: 192.168.99.101:443"
echo "Ip address wordpress: 192.168.99.102:5050"
echo "Ip address phpmyadmin: 192.168.99.103:5000"
echo "Ip address grafana: 192.168.99.110:3000"
echo "Ip address ftps: 192.168.99.105:21"
echo "Hostname influx: http://influxdb-svc:8086"
echo "Hostname mysql: mysql-svc:3306\n\033[0m"