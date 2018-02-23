#!/bin/bash

docker rmi --force skores/jenkins-master:lts-alpine || echo "Image jenkins-master not found."
docker build -t skores/jenkins-master:lts-alpine .
docker push skores/jenkins-master:lts-alpine
