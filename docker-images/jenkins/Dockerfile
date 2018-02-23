FROM jenkins/jenkins:lts-alpine

MAINTAINER Jérémy MIRRE - jeremy.mirre@skores.com

ENV JAPA_OPTS -Djava.util.logging.config.file=/var/jenkins_home/log.properties
ENV JENKINS_OPTS --httpPort=-1 --httpsPort=443 --httpsCertificate=/var/lib/jenkins/cert.pem --httpsPrivateKey=/var/lib/jenkins/key.pem
ENV JENKINS_SLAVE_AGENT_PORT 50000

# Copy important configuration files
COPY https.pem /var/lib/jenkins/cert.pem
COPY https.key /var/lib/jenkins/key.pem
COPY custom.groovy /usr/share/jenkins/ref/init.groovy.d/custom.groovy
COPY executors.groovy /usr/share/jenkins/ref/init.groovy.d/executors.groovy
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt

# Pass plugin list 
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt


