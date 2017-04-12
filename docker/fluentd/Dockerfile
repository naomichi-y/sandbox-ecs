FROM fluent/fluentd:stable-debian
MAINTAINER "Naomichi Yamakita" <n.yamakita@gmail.com>

USER root
RUN apt-get update && apt-get -y install ruby-dev apt-get install build-essential vim
RUN fluent-gem install fluent-plugin-concat
