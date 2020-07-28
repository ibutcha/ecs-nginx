# Install nginx from the source in ubuntu 18:04 to make it more flexible for example if we'll install different modules etc.
# Nginx version 1.18.0
# Created by Butch on June 18, 2020
# Build this dockerfile via this command: docker build -t butch/sdc-nginx:1.0.0 .

FROM ubuntu:18.04

MAINTAINER Charlie "Butch" Santos <cusantos@globe.com>



# Update and install the necessary tools
RUN apt-get update  -y && \
    apt-get install -y apt-utils && \
    apt-get install -y build-essential  && \
    apt-get install -y libpcre3 libpcre3-dev zlib1g zlib1g-dev libssl-dev -y && \
    apt-get install -y wget && \
    apt-get install -y curl

# Install nginx from the source & compile and install the modules.
RUN wget https://nginx.org/download/nginx-1.18.0.tar.gz && \
    tar -zxvf nginx-1.18.0.tar.gz && \
    mv nginx-1.18.0 nginx && \
    cd nginx && \
    ./configure \
        --sbin-path=/usr/bin/nginx \
        --conf-path=/etc/nginx/nginx.conf \
        --error-log-path=/var/log/nginx/error.log \
        --http-log-path=/var/log/nginx/access.log  \
        --with-pcre \
        --pid-path=/var/run/nginx.pid \
        --with-http_ssl_module && \
        make && make install && nginx -V

COPY nginx.conf /etc/nginx/nginx.conf

ENTRYPOINT ["nginx", "-g", "daemon off;"]
