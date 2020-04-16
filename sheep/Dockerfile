from debian:stretch-slim as build

run apt-get update -y
run apt-get install -y git subversion autoconf libtool libgtk2.0-dev \
        libgl1-mesa-dev libavcodec-dev libavformat-dev libswscale-dev \
        liblua5.1-0-dev libcurl4-openssl-dev libxml2-dev libjpeg62-turbo-dev \
        libgtop2-dev libboost-dev libboost-filesystem-dev libboost-thread-dev \
        libtinyxml-dev freeglut3-dev glee-dev libwxgtk3.0-dev

run mkdir /src
workdir /src
run git clone https://github.com/scottdraves/flam3.git
run git clone https://github.com/scottdraves/electricsheep.git

workdir /src/flam3
run ./configure
run make
run make install

workdir /src/electricsheep/client_generic
run ./autogen.sh
run ./configure
run make
run make install

entrypoint ["/usr/local/bin/electricsheep"]
