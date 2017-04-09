FROM amazonlinux:latest
MAINTAINER "Naomichi Yamakita" <n.yamakita@gmail.com>

ENV TERM xterm

ADD docker/rails/.bashrc /root/.bashrc
ADD docker/rails/.gemrc /root/.gemrc
ADD docker/rails/gemrc /usr/local/etc/gemrc

RUN yum update -y && \
  yum install -y cowsay lolcat vim sysstat git zip bzip2 gcc gcc-c++ readline-devel openssl-devel zlib-devel sqlite-devel mysql-devel && \
  curl -O http://ftp.ruby-lang.org/pub/ruby/2.4/ruby-2.4.1.tar.gz && \
  tar zxvf ruby-2.4.1.tar.gz && \
  cd ruby-2.4.1 && \
  ./configure --disable-install-doc && \
  make && \
  make install && \
  cd .. && \
  rm -r ruby-2.4.1 ruby-2.4.1.tar.gz
RUN gem install bundler

ENV APP_ROOT_DIR /data/app
WORKDIR $APP_ROOT_DIR

ADD Gemfile $APP_ROOT_DIR/Gemfile
ADD Gemfile.lock $APP_ROOT_DIR/Gemfile.lock
RUN bundle config --global silence_root_warning 1 && bundle install
ADD . $APP_ROOT_DIR

ADD ./docker/rails/start-server.sh /usr/local/bin/start-server.sh
CMD ["/usr/local/bin/start-server.sh"]
