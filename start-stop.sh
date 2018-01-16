#!/bin/bash

state=$1

case $state in
	start*)
		minikube start --vm-driver=kvm2
		;;
	stop*)
		minikube stop 
		;;
	
	*) printf "No valid state provided."
		;;
esac
