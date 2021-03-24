#!/bin/sh
set -e

apk add curl git openssh-client maven npm p7zip util-linux jq bash binutils openjdk11

# for envsubst
apk add gettext

echo "# Python2 & Python3"
apk add python2 python3

echo "# Getting aws cli"
apk add py-pip
pip install --upgrade pip
pip install awscli

echo "# Getting kubectl"
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
chmod +x ./kubectl
mv kubectl /usr/bin/kubectl

echo "Getting helm"
apk add openssl # Avoid openssl: command not found
curl https://raw.githubusercontent.com/helm/helm/master/scripts/get > get_helm.sh
chmod 700 get_helm.sh
./get_helm.sh

echo "Getting @angular/cli"
npm install -g @angular/cli

echo "Getting Ansible"
apk add ansible

echo "Getting fill-yaml-from-env"
mkdir ~/bin
cd ~/bin
git clone https://github.com/sdenel/fill-yaml-from-env

echo "Installing docker-compose"
# See https://wiki.alpinelinux.org/wiki/Docker#Docker_Compose
apk add python-dev libffi-dev openssl-dev gcc libc-dev make
pip install docker-compose
# TODO: apk remove python-dev libffi-dev openssl-dev gcc libc-dev make

pip install j2cli

apk add brotli

