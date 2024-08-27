#!/bin/bash

# latest_version=$(curl -s https://download.docker.com/linux/static/stable/x86_64/ | grep -oE 'docker-[0-9]+\.[0-9]+\.[0-9]+\.tgz' | head -n 1)
# Download the Docker tarball
wget https://download.docker.com/linux/static/stable/x86_64/docker-26.1.3.tgz

# Extract the Docker tarball
tar xzvf docker-19.03.13.tgz

# Move the Docker binary to /usr/bin/docker
sudo mv docker/docker /usr/bin/docker

# Verify the Docker installation
docker --version
