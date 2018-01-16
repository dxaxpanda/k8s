#!/bin/bash

curl https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get > get_helm.sh && \
	sudo bash get_helm.sh && \
	helm init
