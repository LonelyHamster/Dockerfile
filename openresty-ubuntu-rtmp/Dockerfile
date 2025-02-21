FROM ubuntu:22.04

RUN apt-get update && apt-get install -y libpcre3-dev libssl-dev perl make build-essential curl \
    zlib1g zlib1g-dev wget unzip git libmaxminddb0 libmaxminddb-dev mmdb-bin

WORKDIR /opt/openresty

RUN wget https://openresty.org/download/openresty-1.27.1.1.tar.gz && \
    wget https://github.com/arut/nginx-rtmp-module/archive/refs/heads/master.zip -O nginx-rtmp-module-master.zip && \
    tar -zxvf openresty-1.27.1.1.tar.gz && \
    unzip nginx-rtmp-module-master.zip && \
    cd openresty-1.27.1.1 && \
    ./configure --prefix=/opt/openresty --add-module=../nginx-rtmp-module-master --with-http_ssl_module --with-luajit && \
    make && make install

RUN ln -s /opt/openresty/bin/openresty /usr/local/bin/openresty &&\
    ln -s /opt/openresty/bin/opm /usr/local/bin/opm

WORKDIR /opt/openresty

RUN wget https://luarocks.github.io/luarocks/releases/luarocks-3.11.1.tar.gz && \
    tar -zxvf luarocks-3.11.1.tar.gz && \
    cd luarocks-3.11.1 && \
    ./configure \
    --prefix=/opt/openresty/luajit \
    --sysconfdir=/opt/openresty/luajit/etc \
    --with-lua=/opt/openresty/luajit \
    --with-lua-bin=/opt/openresty/luajit/bin \
    --lua-version=5.1 \
    --with-lua-include=/opt/openresty/luajit/include/luajit-2.1 && \
    make && make install

RUN ln -s /opt/openresty/luajit/bin/luarocks /usr/local/bin/luarocks && \
    rm -rf /opt/openresty/openresty-1.27.1.1.tar.gz && \
    rm -rf /opt/openresty/nginx-rtmp-module-master.zip && \
    rm -rf /opt/openresty/luarocks-3.11.1.tar.gz

COPY nginx.conf /opt/openresty/nginx/conf/nginx.conf

CMD ["openresty", "-g", "daemon off;"]
