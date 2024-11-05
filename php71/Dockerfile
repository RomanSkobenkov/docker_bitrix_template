FROM bitrixdock/php71-fpm:latest

RUN apt-get update \
    && apt-get -y --no-install-recommends install \
    php7.1-memcached \
    php7.1-memcache \
    php7.1-mbstring \
    php7.1-mysql \
    php7.1-intl \
    php7.1-interbase \
    php7.1-soap \
    php7.1-gd \
    php7.1-imagick \
    php7.1-ldap \
    php7.1-opcache \
    php7.1-zip \
    php7.1-simplexml \
    php7.1-dom \
    php-pear php-dev libmcrypt-dev gcc make autoconf libc-dev pkg-config z\
    && pecl install mcrypt-1.0.3 \
    && apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

RUN apt-get update \
    && apt-get -y install  ca-certificates \
    msmtp

COPY ./php.ini /etc/php/7.1/fpm/conf.d/90-php.ini
COPY ./php.ini /etc/php/7.1/cli/conf.d/90-php.ini

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

RUN usermod -u 1000 www-data

WORKDIR "/var/www/htdocs"

EXPOSE 9000