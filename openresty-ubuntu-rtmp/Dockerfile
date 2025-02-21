FROM ubuntu:22.04

RUN apt-get update && apt-get install -y libpcre3-dev libssl-dev perl make build-essential curl \
    zlib1g zlib1g-dev wget unzip git libmaxminddb0 libmaxminddb-dev mmdb-bin vim

WORKDIR /opt/openresty

RUN wget https://openresty.org/download/openresty-1.27.1.1.tar.gz && \
    wget https://github.com/arut/nginx-rtmp-module/archive/refs/heads/master.zip -O nginx-rtmp-module-master.zip && \
    tar -zxvf openresty-1.27.1.1.tar.gz && \
    unzip nginx-rtmp-module-master.zip && \
    cd openresty-1.27.1.1 && \
    ./configure --prefix=/opt/openresty --add-module=../nginx-rtmp-module-master --with-http_ssl_module --with-luajit && \
    make && make install

RUN ln -s /opt/openresty/bin/openresty /usr/local/bin/openresty && \
    ln -s /opt/openresty/bin/opm /usr/local/bin/opm && \
    rm -rf /opt/openresty/openresty-1.27.1.1.tar.gz && \
    rm -rf /opt/openresty/nginx-rtmp-module-master.zip

RUN apt-get -y install luarocks && \
    luarocks install luajit-geoip && \
    opm get leafo/geoip

COPY nginx.conf /opt/openresty/nginx/conf/nginx.conf

CMD ["openresty", "-g", "daemon off;"]
