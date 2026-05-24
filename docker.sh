#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

echo "Cleaning up any conflicting packages (podman/buildah)..."
sudo dnf remove -y docker docker-client docker-client-latest docker-common docker-latest docker-latest-logrotate docker-logrotate docker-engine podman buildah

echo "Installing dnf-plugins-core..."
sudo dnf install -y dnf-plugins-core

echo "Adding Docker official repository..."
sudo dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

echo "Installing Docker CE and plugins..."
sudo dnf install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo "Starting and Enabling Docker service..."
sudo systemctl start docker
sudo systemctl enable docker

echo "Adding current user to the docker group..."
sudo usermod -aG docker $USER

echo "Docker installation completed successfully!"
echo "Note: Please log out and log back in (or run 'newgrp docker') to use Docker without sudo."
