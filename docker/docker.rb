docker info 

docker images -a 
docker image ls
docker image ls -a
docker image ls ubuntu:18.04

docker ps -a -q
# 97ada3059e70

docker stop 97ada3059e70

docker rm 97ada3059e70


docker run -d -p 80:80 webserver nginx

docker stop webserver
docker rm webserver




docker run --name repo alpine/git clone https://github.com/docker/getting-started.git

docker cp repo:/git/getting-started/ .


cd getting-started
docker build -t docker101tutorial .

docker run -d -p 80:80 --name docker-tutorial docker101tutorial

docker tag docker101tutorial k8slg/docker101tutorial
docker push k8slg/docker101tutorial



docker pull ubuntu:18.04

docker run -it --rm ubuntu:18.04 bash


docker system df

# 删除全部dangling虚悬镜像
docker image prune

docker image ls --format "{{.ID}}: {{.Repository}}"


docker logs 71c842e91713

docker exec -it 71c842e91713 /bin/bash

docker container prune


docker export e1674f9f2276 > ~/work/ubuntu.tar

cat ubuntu.tar | docker import - test/ubuntu:v1.0

docker import http://www.example.com/ubuntu.tgz example/ubuntu


docker search ubuntu

docker pull ubuntu


docker run -d -p 5000:5000 --restart=always --name registry registry


docker image rm localhost:5000/ubuntu:18.04

docker pull localhost:5000/ubuntu:18.04

# 配置本地ip仓库地址
"insecure-registries": [
    "192.168.199.100:5000"
  ]


docker volume ls

docker volume create my-vol

docker volume inspect my-vol

docker run -d -P --name web --mount source=my-vol,target=/usr/share/nginx/html nginx:latest

docker inspect web

docker volume rm my-vol
docker volume prune

docker run -d -P --name web --mount type=bind,source=/Users/liugang/work/nginx-vol,target=/usr/share/nginx/html,readonly nginx:latest

docker run -it --rm --mount type=bind,source=$HOME/.bash_history,target=/root/.bash_history ubuntu:18.04 bash

docker port 4c 80

docker run -d -p 80:80 -p 443:443 nginx:latest

docker network ls

docker network create -d bridge my-net

docker run -it --rm --name busybox1 --network my-net busybox sh
docker run -it --rm --name busybox2 --network my-net busybox sh

ping busybox2
ping busybox1

docker diff 4c

docker commit --author "lg <501225658@qq.com>" --message "first commit" webserver nginx:v2

docker history nginx:v2

FROM scratch
# Dockerfile
FROM nginx
RUN echo 'hello docker' > /usr/share/nginx/html/index.html

docker build -t nginx:v3 .

docker build -t hello-world https://github.com/docker-library/hello-world.git#master:amd64/hello-world

docker build http://server/context.tar.gz

docker build - < Dockerfile

cat Dockerfile | docker build -

docker build - < context.tar.gz



docker inspect --format '{{json .State.Health}}' web | python -m json.tool


虚空











