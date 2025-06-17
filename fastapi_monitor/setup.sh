#!/bin/bash

echo "Atualizando pacotes..."
sudo apt update && sudo apt upgrade -y

echo "Instalando Docker..."
sudo apt install docker.io -y
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker $USER

echo "Instalando Docker Compose Plugin..."
sudo apt install docker-compose-plugin -y

echo "Instalação concluída. Faça logout e login novamente para aplicar permissões do Docker."
