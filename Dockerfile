FROM ubuntu:bionic
MAINTAINER Jaskaran Singh <jaskarannagi19@gmail.com>




# replace shell with bash so we can source files
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# update the repository sources list
# and install dependencies
RUN apt-get update \
    && apt-get install -y curl \
    && apt-get -y autoclean

# nvm environment variables
ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION 4.4.7

# install nvm
# https://github.com/creationix/nvm#install-script
RUN curl --silent -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.2/install.sh | bash

# install node and npm
RUN source $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default

# add node and npm to path so the commands are available
ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

# confirm installation
RUN node -v
RUN npm -v

RUN apt-get update

ARG DEBIAN_FRONTEND=noninteractive





RUN apt-get -y install python2.7
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install keyboard-configuration
RUN ln -s /usr/bin/python2.7 /usr/bin/python
RUN apt-get -y install build-essential
RUN apt-get -y  install libglu1-mesa libxi-dev libxmu-dev libglu1-mesa-dev
RUN apt-get -y  install libxcursor1 libxrandr-dev libtiff5


RUN apt-get -y install lubuntu-core xvfb x11vnc tightvncserver
RUN ln -s /usr/lib/x86_64-linux-gnu/libtiff.so.5 /usr/lib/x86_64-linux-gnu/libtiff.so.3
RUN apt-get -y install libssl-dev
RUN ln -s /usr/lib/x86_64-linux-gnu/libssl.so.1.0.0 /usr/lib/x86_64-linux-gnu/libssl.so.6
RUN ln -s /usr/lib/x86_64-linux-gnu/libcrypto.so.1.0.0 /usr/lib/x86_64-linux-gnu/libcrypto.so.6
RUN apt-get install -y wget
RUN wget http://security.ubuntu.com/ubuntu/pool/main/libp/libpng/libpng12-0_1.2.54-1ubuntu1.1_amd64.deb
RUN dpkg -i libpng12-0_1.2.54-1ubuntu1.1_amd64.deb
