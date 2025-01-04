FROM openresty/openresty:jammy

RUN apt update && apt install libmaxminddb0 libmaxminddb-dev mmdb-bin

RUN luarocks install luajit-geoip

RUN opm get leafo/geoip