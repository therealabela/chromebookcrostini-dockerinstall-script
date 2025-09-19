#!/bin/bash

# A script to install Docker on Debian.
# Author: therealabela | github.com/therealabela

# Display welcome message
clear
echo "-------------------------"
echo "Script to install Docker"
echo "-------------------------"
echo "By: therealabela [] github.com/therealabela"
echo "-------------------------"
echo "Running Installation Script:"
echo "This may take 5-10 min!"
echo "-------------------------"

# Update and install required dependencies
sudo apt update -y
sudo apt install ca-certificates curl gnupg lsb-release -y

# Add Docker's official GPG key
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# Add the Docker APT repository to sources.list.d
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update the package index again with the new repository
sudo apt update

# Install Docker packages
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

# Verify Installation with hello-world
clear
echo "-------------------------"
echo "Verify Installation"
echo "Check if there is output on the next line!"
echo "-------------------------"
sudo docker run hello-world
echo "-------------------------"
echo "Script Complete!"
echo "-------------------------"
