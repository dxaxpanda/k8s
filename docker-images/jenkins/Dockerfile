FROM jenkins/jenkins:lts-alpine

MAINTAINER Jérémy MIRRE - jeremy.mirre@skores.com

ENV JAPA_OPTS -Djava.util.logging.config.file=/var/jenkins_home/log.properties
ENV JENKINS_OPTS --httpPort=8080
# --httpsPort=443 --httpsCertificate=/var/jenkins_home/cert.pem --httpsPrivateKey=/var/jenkins_home/key.pem

ENV JENKINS_SLAVE_AGENT_PORT 50000

USER root

RUN apk update && \
    apk add --no-cache \
    docker \
    rsync \
    php7 \
    php7-phar \
    php7-json \
    php7-gd \
    php7-mbstring && \
    curl -LO https://deployer.org/deployer.phar && \
    mv deployer.phar /usr/local/bin/dep && \
    chmod +x /usr/local/bin/dep

USER jenkins 

# Copy important configuration files
COPY custom.groovy /usr/share/jenkins/ref/init.groovy.d/custom.groovy
COPY executors.groovy /usr/share/jenkins/ref/init.groovy.d/executors.groovy
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt

# Pass plugin list 
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt


