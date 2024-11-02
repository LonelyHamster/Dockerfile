FROM php:7.4.33-fpm-buster

# 安装必要的系统依赖
RUN apt-get update && apt-get install -y \
    libzip-dev \
    libonig-dev \
    libxml2-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libfreetype6-dev \
    libcurl4-openssl-dev \
    zlib1g-dev \
    libmemcached11 \
    libmemcached-dev \
    zip \
    unzip \
    curl

# 安装常用扩展
RUN docker-php-ext-install zip
RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-install mysqli
RUN docker-php-ext-install opcache
RUN docker-php-ext-install curl
RUN docker-php-ext-install mbstring
RUN docker-php-ext-install json
RUN docker-php-ext-install xml
RUN docker-php-ext-install bcmath
RUN docker-php-ext-install dom
RUN docker-php-ext-install fileinfo

# 安装 GD 扩展
RUN docker-php-ext-configure gd --with-jpeg --with-freetype \
    && docker-php-ext-install gd

# 安装 Redis 扩展
RUN pecl install redis \
    && docker-php-ext-enable redis

# 安装 Memcached 扩展
RUN pecl install memcached \
    && docker-php-ext-enable memcached

# 安装 Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer