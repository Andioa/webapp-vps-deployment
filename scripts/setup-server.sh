#!/bin/bash

# Update and install necessary packages
sudo apt update && sudo apt upgrade -y
sudo apt install -y nginx docker.io docker-compose git

# Start and enable services
sudo systemctl start nginx
sudo systemctl enable nginx
sudo systemctl start docker
sudo systemctl enable docker

# Set up firewall (optional)
sudo ufw allow 'Nginx Full'
sudo ufw allow OpenSSH
sudo ufw enable
