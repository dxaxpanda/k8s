FROM jenkins/jnlp-slave:alpine
MAINTAINER Jérémy MIRRE - jeremy.mirre@skores.com

ENV AGENT_WORKDIR /home/jenkins/agent
ENV COMPOSER_ALLOW_SUPERUSER 1
ENV COMPOSER_HOME $HOME/.composer
ENV COMPOSER_VERSION 1.6.3
ENV PHP_INI_DIR /etc/php7
ENV PATH $HOME/.composer/vendor/bin:$PATH
# Fix utf-8 convert issue with phpdox
ENV LD_PRELOAD /usr/lib/preloadable_libiconv.so
USER root
# Set the lang, you can also specify it as as environment variable through docker-compose.yml
ENV LANG=fr_FR.UTF-8 \ 
    LANGUAGE=fr_FR.UTF-8 \ 
    LC_CTYPE=fr_FR.UTF-8 \ 
    LC_ALL=fr_FR.UTF-8

# add gnu libiconv for utf8 encoding issue
RUN apk add --no-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing gnu-libiconv

RUN set -x &&  \
    echo "unicode=\"YES\"" >> /etc/rc.conf && \
    mkdir $COMPOSER_HOME && \
    apk update && \
    apk add --no-cache \
    shadow \
    php7 \
    php7-openssl \
    php7-phar \
    php7-json \
    php7-gd \
    php7-zip \
    php7-iconv \
    php7-fileinfo \
    php7-dom \
    php7-curl \
    php7-xsl \
    php7-intl \
    php7-tokenizer \
    php7-mbstring \
    php7-zlib \
    php7-iconv \
    php7-xml \
    php7-fileinfo \
    php7-pdo \
    php7-ctype \
    php7-simplexml \
    php7-xdebug \
    php7-xmlwriter

# Enable XDEBUG
RUN sed -i "s/;zend_extension=/zend_extension=/g" /etc/php7/conf.d/xdebug.ini

# Change jenkins uid/gid to the master image
RUN usermod --uid 1000 jenkins && groupmod --gid 1000 jenkins

WORKDIR $COMPOSER_HOME

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php'); \
    \$signature = '544e09ee996cdf60ece3804abc52599c22b1f40f4323403c44d44fdfdd586475ca9813a858088ffbc1f233e9b180f061'; \
    \$hash = hash('SHA384', file_get_contents('composer-setup.php')); \
    if (!hash_equals(\$signature, \$hash)) { \
        unlink('composer-setup.php'); \
        echo 'Integrity check failed, installer is either corrupt or worse.' . PHP_EOL; \
        exit(1); \
    }" && \
    php composer-setup.php --no-ansi --install-dir=/usr/bin --filename=composer --version=${COMPOSER_VERSION} && \
    composer --ansi --version --no-interaction && \
    chown -R jenkins:jenkins $COMPOSER_HOME && \
    rm -rf /tmp/* /tmp/.htaccess $COMPOSER_HOME/composer-setup.php

USER jenkins


COPY composer.json $COMPOSER_HOME
COPY auth.json $COMPOSER_HOME
RUN composer update
RUN chown -R jenkins: $COMPOSER_HOME/cache
WORKDIR $AGENT_WORKDIR
