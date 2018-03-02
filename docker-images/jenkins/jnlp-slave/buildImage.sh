#!/bin/bash
set -e
docker stop jenkins-slave && docker rm -f jenkins-slave 
docker build -t skores/jenkins-jnlp-slave:1.0-alpine . 
docker push skores/jenkins-jnlp-slave:1.0-alpine
docker pull skores/jenkins-jnlp-slave:1.0-alpine

