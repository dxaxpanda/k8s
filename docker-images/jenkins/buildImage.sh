#!/bin/bash
set -e
docker stop jenkins-master && docker rm -f jenkins-master 
docker rmi skores/jenkins-master:lts-alpine || echo "Image jenkins-master not found."
docker build -t skores/jenkins-master:lts-alpine . 
docker push skores/jenkins-master:lts-alpine
