FROM phpdockerio/php:8.2-fpm

RUN apt-get update \
    && apt-get -y --no-install-recommends install \
    php8.2-memcached \
    php8.2-memcache \
    php8.2-mbstring \
    php8.2-mysql \
    php8.2-intl \
    php8.2-interbase \
    php8.2-redis \
    php8.2-soap \
    php8.2-gd \
    php8.2-imagick \
    php8.2-opcache \
    php8.2-zip \
    git \
    zlib1g-dev \
    php-pear php8.2-dev libmcrypt-dev gcc make autoconf libc-dev pkg-config \
    && pecl install mcrypt \
    && apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

# Install xdebug
RUN pecl install xdebug \
    docker-php-ext-enable xdebug

RUN mkdir /usr/local/nvm
ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION 14.17.3
RUN curl https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash \
  && . $NVM_DIR/nvm.sh \
  && nvm install $NODE_VERSION \
  && nvm alias default $NODE_VERSION \
  && nvm use default
ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

COPY ./php.ini /etc/php/8.2/fpm/conf.d/90-php.ini
COPY ./php.ini /etc/php/8.2/cli/conf.d/90-php.ini

RUN usermod -u 1000 www-data

WORKDIR "/var/www"

EXPOSE 9000