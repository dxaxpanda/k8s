#!/bin/bash
set -e
printf "[*]\t%s\n" "Creating jenkins data volume."
docker volume create jenkins 
docker stop jenkins-master && docker rm -f jenkins-master || echo "No container found."
printf "[*]\t%s\n"  "Starting new container"
docker run -d --restart=always --privileged --name=jenkins-master -p 127.0.0.1:8080:8080 -p 10.0.0.22:50000:50000 -v jenkins_backup:/var/jenkins_home skores/jenkins-master:lts-alpine

