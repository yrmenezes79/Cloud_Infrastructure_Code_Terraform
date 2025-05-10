#!/bin/bash
sudo apt update -y
sudo apt install -y docker.io
sudo systemctl start docker
sudo systemctl enable docker
# Detecta o usuário padrão (Ubuntu ou Amazon Linux)
DEFAULT_USER=$(getent passwd 1000 | cut -d: -f1)
sudo usermod -aG docker $DEFAULT_USER
