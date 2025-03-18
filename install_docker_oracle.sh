#!/bin/bash

# Actualizar los paquetes del sistema
sudo yum update -y

# Instalar los paquetes necesarios
sudo yum install -y yum-utils device-mapper-persistent-data lvm2

# Añadir el repositorio de Docker
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

# Instalar Docker
sudo yum install -y docker-ce docker-ce-cli containerd.io

# Iniciar el servicio de Docker y configurarlo para que se inicie al arrancar el sistema
sudo systemctl start docker
sudo systemctl enable docker

# Añadir tu usuario al grupo docker para ejecutar comandos sin sudo (opcional)
sudo usermod -aG docker $USER

# Instalar Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# Dar permisos de ejecución a Docker Compose
sudo chmod +x /usr/local/bin/docker-compose

sudo yum install git

# Verificar la instalación de Docker y Docker Compose
docker --version
docker-compose --version
