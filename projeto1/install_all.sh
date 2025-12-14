#!/bin/bash
set -e

echo "Detectando sistema operacional..."

# Detecta ID do SO
if [ -f /etc/os-release ]; then
  . /etc/os-release
  OS_ID=$ID
else
  echo "Não foi possível detectar o sistema operacional"
  exit 1
fi

echo "Sistema detectado: $OS_ID"

# Instala Docker conforme o SO
case "$OS_ID" in
  ubuntu|debian)
    echo "Usando APT"
    apt update -y
    apt install -y docker.io
    ;;
  rhel|centos|rocky|almalinux)
    echo "Usando DNF (RHEL-like)"
    dnf update -y
    dnf install -y docker
    ;;
  amzn)
    echo "Usando Amazon Linux"
    dnf update -y
    dnf install -y docker
    ;;
  *)
    echo "Sistema operacional não suportado: $OS_ID"
    exit 1
    ;;
esac

# Inicia e habilita o Docker
systemctl start docker
systemctl enable docker

# Detecta usuário padrão (UID 1000)
DEFAULT_USER=$(getent passwd 1000 | cut -d: -f1)

# Adiciona usuário ao grupo docker (se existir)
if [ -n "$DEFAULT_USER" ]; then
  usermod -aG docker "$DEFAULT_USER"
  echo "Usuário $DEFAULT_USER adicionado ao grupo docker"
else
  echo "Usuário padrão não encontrado"
fi

echo "Instalação do Docker concluída com sucesso"
