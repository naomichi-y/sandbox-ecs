FROM mysql:latest
MAINTAINER "Naomichi Yamakita" <n.yamakita@gmail.com>

ADD ./conf.d /etc/mysql/conf.d
COPY ./docker-entrypoint-initdb.d /docker-entrypoint-initdb.d
