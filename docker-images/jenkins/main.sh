#!/bin/bash
set -e
printf "[*]\t%s\n" "Launching jenkins scripts..."
. buildImage.sh
sudo python3 setup_certs.py
. bootstrap.sh 
