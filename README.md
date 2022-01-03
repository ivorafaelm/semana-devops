# Semana Devops - Linuxtips

## Desafio - Semana Devops

O desafio foi proposto durante a aula de Kubernetes da Semana Devops promovida pela Linuxtips e consiste basicamente em:

- Efetuar a criação de um cluster kubernetes com o Kind através do uso do Terraform;
- Efetuar a criação de recursos dentro do cluster com o Terraform (se possível efetuar a criação de um deployment contendo uma determinada imagem);

## Ambiente

### Mac OS X

Abaixo estão descritos os passos necessários para a configuração do ambiente no Mac OS X.

As sequintes ferramentas estão instaladas na máquina utilizada para os testes:

- Docker Desktop

- Kind (através do homebrew)
```bash
brew install kind
```
- Terraform (através do homebrew)
```bash
brew tap hashicorp/tap
brew install hashicorp/tap/terraform
```

### Ubuntu 20.04

Abaixo estão descritos os passos necessários para a configuração do ambiente no Ubuntu 20.04.

- Docker
```bash
sudo apt-get update
sudo apt-get install     ca-certificates     curl     gnupg     lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo   "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io
sudo usermod -aG docker $USER
newgrp docker
```

- Kind
```bash
 curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.11.1/kind-linux-amd64
 chmod +x ./kind
 env
 mv ./kind /usr/local/bin/.
 sudo mv ./kind /usr/local/bin/.

```

- Terraform
```bash
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common curl
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update && sudo apt-get install terraform
```

## Providers - Terraform

Os providers utilizados para a construção dos ambientes foram os seguintes:

- Kubernetes provider (https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs);
- Kind by Kyma-Incubator (https://registry.terraform.io/providers/kyma-incubator/kind/latest);

## Forma de utilização

Efetuar o clone do repositório e a partir dele executar os seguintes comandos:

```bash
cd cluster
terraform init
terraform plan
terraform apply
```

Pronto!
Seu cluster está fununciando em ritmo de festa que balança o coração.

## To do

- Efetuar a implementação para que seja necessário executar todos os passos do terraform em uma única chamada;
- Efetuar a criação de um tutorial com a implementação através da utilização do WSL2
