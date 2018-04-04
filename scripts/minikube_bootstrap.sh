#!/bin/bash

curl -Lo minikube https://storage.googleapis.com/minikube/releases/v0.25.2/minikube-linux-amd64 && \
	chmod +x minikube && \ 
	sudo mv minikube /usr/local/bin/
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl && \
	 chmod +x ./kubectl && \
	  sudo mv ./kubectl /usr/local/bin/kubectl
curl -LO https://storage.googleapis.com/minikube/releases/latest/docker-machine-driver-kvm2 && \
	chmod +x docker-machine-driver-kvm2 && \
	sudo mv docker-machine-driver-kvm2 /usr/bin/
