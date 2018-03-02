#!/bin/bash
set -e
JENKINS_SLAVE_NAME=jenkins-slave
JENKINS_SERVER_URL=jenkins-master
JENKINS_SERVER_PORT=8080
JENKINS_WORKDIR=/home/jenkins/agent


printf "[*]\t%s\n"  "Starting new container"
docker rm -f $JENKINS_SLAVE_NAME || printf "[*] No slave found"
printf "[*]\t%s\n"  "Starting new container"
docker run -d --link $JENKINS_SERVER_URL --name=$JENKINS_SLAVE_NAME skores/jenkins-jnlp-slave:1.0-alpine -url http://$JENKINS_SERVER_URL:$JENKINS_SERVER_PORT -workDir=$JENKINS_WORKDIR c5a7c46c60663cdfe87589d987c13f9ca9792a11012916df36e2599f0205053a test

