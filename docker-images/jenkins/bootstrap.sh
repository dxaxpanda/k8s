#!/bin/bash

docker volume create jenkins
docker rm -f jenkins-master || echo "No jenkins container running."
echo "[*] Starting new container"
docker run -d --name=jenkins-master -p 8080:8080 -p 50000:50000 -v jenkins:/var/jenkins_home skores/jenkins-master:lts-alpine
