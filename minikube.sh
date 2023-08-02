#!/bin/bash

# Установка Docker
echo "Установка Docker..."
sudo apt update
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io
sudo usermod -aG docker $USER
echo "Docker установлен и настроен."

# Установка Minikube
echo "Установка Minikube..."
sudo apt install -y conntrack
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
rm minikube-linux-amd64
echo "Minikube установлен."

# Установка kubectl
echo "kubectl установлен."
sudo snap install kubectl --classic

# Загрузка и установка Helm
curl -LO "https://get.helm.sh/helm-v3.7.1-linux-amd64.tar.gz"
tar -zxvf helm-v3.7.1-linux-amd64.tar.gz
sudo mv linux-amd64/helm /usr/local/bin/
rm -rf linux-amd64 helm-v3.7.1-linux-amd64.tar.gz

echo "Helm установлен."


# Перезагрузка системы, чтобы применить изменения группы docker
echo "Перезагрузка системы..."
sudo reboot
