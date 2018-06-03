#!/bin/bash

echo "Uninstall old versions"
sudo apt-get -y remove docker docker-engine docker-ce docker.io
echo"Uninstallation of old versions completed"

echo "Updating"
sudo apt-get -y update
echo "update 1 completed"

echo "installing Extra packages"
sudo apt-get -y install \
    linux-image-extra-$(uname -r) \
    linux-image-extra-virtual\
echo "completed install inux packages"

echo "updating"
sudo apt-get update
echo "update 2 done"

echo "installing certs"
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
echo "Cert installation completed"

echo "curl"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

echo "add key"
sudo apt-key fingerprint 0EBFCD88

echo "add repo"
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
echo "updating"
sudo apt-get update
echo "update3 completed"

echo "Instaling docker"
sudo apt-get -y install docker-ce
echo "Docker installation completed"

echo "Build image"
docker build -t akshaygirpunje/gitapacheimage -f Dockerfile .
echo " Successfully build image"

echo "Run apache server image"
# docker run -p 1114:80 -i -t apacheimage /bin/bash
#tdocker run -p 1114:80 -d apacheimage

