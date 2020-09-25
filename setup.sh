#services=("nginx" "wordpress" "ftps" "phpmyadmin" "mysql" "influx" "grafana")
services=("nginx" "wordpress" "phpmyadmin" "mysql")
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

kubectl apply srcs/yamls/volume.yaml

for service in "${services[@]}"
do
kubectl apply -f srcs/yamls/${service}.yaml
done