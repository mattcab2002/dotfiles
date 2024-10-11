#!/usr/bin/env bash

set -e

echo "Updating package list..."
sudo apt update

echo "Installing required packages..."
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

echo "Adding Docker GPG key..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo "Adding Docker repository..."
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list >/dev/null

echo "Updating package list with Docker packages..."
sudo apt update

echo "Checking available Docker packages..."
apt-cache policy docker-ce

echo "Installing Docker CE..."
sudo apt install -y docker-ce

echo "Verifying Docker service status..."
sudo systemctl status docker

echo "Adding user to Docker group..."
sudo usermod -aG docker $USER
newgrp docker
