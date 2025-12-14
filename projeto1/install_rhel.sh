#!/bin/bash
# Atualiza os pacotes
sudo dnf update -y
# Instala o Docker
sudo dnf install -y docker
# Inicia e habilita o serviço Docker
sudo systemctl start docker
sudo systemctl enable docker
# Detecta o usuário padrão (UID 1000)
DEFAULT_USER=$(getent passwd 1000 | cut -d: -f1)
# Adiciona o usuário ao grupo docker
sudo usermod -aG docker $DEFAULT_USER


