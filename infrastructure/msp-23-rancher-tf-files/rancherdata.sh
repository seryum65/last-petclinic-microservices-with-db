#! /bin/bash
# Set hostname of instance
hostnamectl set-hostname rancher-instance-1

# Update OS 
apt-get update -y
apt-get upgrade -y

# Install and start Docker on Ubuntu
# Update the apt package index and install packages to allow apt to use a repository over HTTPS
apt-get install apt-transport-https ca-certificates curl gnupg lsb-release -y

# Add Docker’s official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Use the following command to set up the stable repository
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update packages
apt-get update

# Install and start Docker (WARNING!!! in this handsone rancher does not work with the latest version of docker. When installing docker, work with 20.10.*** or lower versions. )
VERSION_DOCKER=5:20.10.24~3-0~ubuntu-focal
apt-get install docker-ce=$VERSION_DOCKER docker-ce-cli=$VERSION_DOCKER containerd.io -y docker-buildx-plugin docker-compose-plugin
systemctl start docker
systemctl enable docker

# Add ubuntu user to docker group
usermod -aG docker ubuntu
newgrp docker

