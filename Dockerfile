FROM       alpine
MAINTAINER Yosuke Yamamoto "yosuke@pyrites.jp"

## Setting Args
ARG RUBY_VERSION=2.3.1
ARG RUBY_BUILD_PATH=/usr/local/ruby-build
ARG RUBY_PATH=/opt/ruby
ARG FOREGO_PATH=/usr/local/bin

## Setting Environmet
ENV PATH $RUBY_PATH/bin:${PATH}

## Required Packages Install
RUN apk update && \
    apk upgrade && \
    apk add git curl bash && \
    apk add --virtual ruby-deps linux-headers build-base openssl-dev libffi-dev readline-dev zlib-dev ncurses-dev gdbm-dev bzip2-dev && \
    (cd $FOREGO_PATH; curl https://bin.equinox.io/c/ekMN3bCZFUn/forego-stable-linux-amd64.tgz | tar xzf -)

## Install ruby-build and rails
RUN git clone https://github.com/rbenv/ruby-build.git $RUBY_BUILD_PATH  && \
    $RUBY_BUILD_PATH/install.sh && rm -Rf RUBY_BUILD_PATH && \
    mkdir -p $RUBY_PATH && \
    CONFIGURE_OPTS="--disable-install-rdoc" ruby-build $RUBY_VERSION $RUBY_PATH && \
    gem install bundler

