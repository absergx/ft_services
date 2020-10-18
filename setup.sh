#services=("nginx" "wordpress" "phpmyadmin" "mysql" "influx" "grafana" "ftps")
services=("nginx" "phpmyadmin" "mysql" "wordpress" "ftps")
minikube start --vm-driver=virtualbox
eval $(minikube docker-env) > /dev/null

minikube addons enable metallb
kubectl apply -f srcs/yamls/metallb.yaml

for service in "${services[@]}"
do
printf "docker build ${service}: "
docker build srcs/${service} -t "${service}-image"
printf "status: OK\n"
done

kubectl apply -f srcs/yamls/volume.yaml

for service in "${services[@]}"
do
kubectl apply -f srcs/yamls/${service}.yaml
done

echo "\nIp address nginx: 192.168.99.101:443\n"
echo "Ip address wordpress: 192.168.99.102:5050\n"
echo "Ip address phpmyadmin: 192.168.99.103:5000\n"
echo "Ip address grafana: 192.168.99.104:3000\n"
echo "Ip address ftps: 192.168.99.105:21\n"

echo "\nHostname influx: http://influxdb-svc:8086\n"
echo "Hostname mysql: mysql-svc:3306\n\033[0m"