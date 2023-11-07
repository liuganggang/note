FROM nginx
RUN echo 'hello docker' > /usr/share/nginx/html/index.html

COPY package.json /usr/src/app/

COPY hom* /mydir/
COPY hom?.txt /mydir/

COPY --chown=55:mygroup files* /mydir/
COPY --chown=bin files* /mydir/
COPY --chown=1 files* /mydir/
COPY --chown=10:11 files* /mydir/


ADD --chown=55:mygroup files* /mydir/
ADD --chown=bin files* /mydir/
ADD --chown=1 files* /mydir/
ADD --chown=10:11 files* /mydir/


CMD echo $HOME
CMD ["nginx", "-g", "daemon off;"]


FROM ubuntu:18.04
RUN apt-get update \
    && apt-get install -y curl \
    && rm -rf /var/lib/apt/lists/*
ENTRYPOINT [ "curl", "-s", "http://myip.ipip.net" ]

ENV VERSION=1.0 DEBUG=on \
    NAME="Happy Feet"


ARG DOCKER_USERNAME=library

FROM ${DOCKER_USERNAME}/alpine

# 在FROM 之后使用变量，必须在每个阶段分别指定
ARG DOCKER_USERNAME=library

RUN set -x ; echo ${DOCKER_USERNAME}

FROM ${DOCKER_USERNAME}/alpine

# 在FROM 之后使用变量，必须在每个阶段分别指定
ARG DOCKER_USERNAME=library

RUN set -x ; echo ${DOCKER_USERNAME}

VOLUME /data

# docker run -d -v mydata:/data xxxx

EXPOSE 50001

WORKDIR /app

RUN echo "hello" > world.txt


WORKDIR /a
WORKDIR b
WORKDIR c

RUN pwd

RUN groupadd -r redis && useradd -r -g redis redis
USER redis
RUN [ "redis-server" ]

# 建立 redis 用户，并使用 gosu 换另一个用户执行命令
RUN groupadd -r redis && useradd -r -g redis redis
# 下载 gosu
RUN wget -O /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/1.12/gosu-amd64" \
    && chmod +x /usr/local/bin/gosu \
    && gosu nobody true
# 设置 CMD，并以另外的用户执行
CMD [ "exec", "gosu", "redis", "redis-server" ]


FROM node:slim
RUN mkdir /app
WORKDIR /app
ONBUILD COPY ./package.json /app
ONBUILD RUN [ "npm", "install" ]
ONBUILD COPY . /app/
CMD [ "npm", "start" ]


LABEL org.opencontainers.image.authors="lg"

LABEL org.opencontainers.image.documentation="https://liuganggang.github.io"


SHELL ["/bin/sh", "-c"]

RUN lll ; ls

SHELL ["/bin/sh", "-cex"]

RUN lll ; ls

SHELL ["/bin/sh", "-cex"]

# /bin/sh -cex "nginx"
ENTRYPOINT nginx

SHELL ["/bin/sh", "-cex"]

# /bin/sh -cex "nginx"
CMD nginx





























