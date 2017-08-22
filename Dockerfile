FROM amazonlinux:latest
MAINTAINER "Naomichi Yamakita" <n.yamakita@gmail.com>

ENV TERM xterm

COPY ./etc/docker/rails/.bashrc /root/.bashrc
COPY ./etc/docker/rails/.gemrc /root/.gemrc
COPY ./etc/docker/rails/gemrc /usr/local/etc/gemrc

RUN yum update -y && \
  yum install -y cowsay lolcat vim sysstat git zip bzip2 gcc gcc-c++ readline-devel openssl-devel zlib-devel sqlite-devel mysql-devel && \
  curl -O http://ftp.ruby-lang.org/pub/ruby/2.3/ruby-2.3.1.tar.gz && \
  tar zxvf ruby-2.3.1.tar.gz && \
  cd ruby-2.3.1 && \
  ./configure --disable-install-doc && \
  make && \
  make install && \
  cd .. && \
  rm -r ruby-2.3.1 ruby-2.3.1.tar.gz
RUN gem install bundler

ENV APP_ROOT_DIR /data/app
WORKDIR $APP_ROOT_DIR

COPY Gemfile $APP_ROOT_DIR/Gemfile
COPY Gemfile.lock $APP_ROOT_DIR/Gemfile.lock
RUN bundle config --global silence_root_warning 1 && bundle install
COPY . $APP_ROOT_DIR

COPY ./docker/rails/start-server.sh /usr/local/bin/start-server.sh
CMD ["/usr/local/bin/start-server.sh"]
