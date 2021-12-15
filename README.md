# Semana Devops - Linuxtips

## Desafio - Semana Devops

O desafio foi proposto durante a aula de Kubernetes da Semana Devops promovida pela Linuxtips e consiste basicamente em:

- Efetuar a criação de um cluster kubernetes com o Kind através do uso do Terraform;
- Efetuar a criação de recursos dentro do cluster com o Terraform (se possível efetuar a criação de um deployment contendo uma determinada imagem);

## Ambiente

Os testes de criação de ambiente foram efetuados em um Mac OS X.

As sequintes ferramentas estão instaladas na máquina utilizada para os testes:

- Docker Desktop
- Kind (através do brew
```bash
brew install kind
```
- Terraform (através do brew)
```bash
brew tap hashicorp/tap
brew install hashicorp/tap/terraform
```

## Providers - Terraform

Os providers utilizados para a construção dos ambientes foram os seguintes:

- Kubernetes provider (https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs);
- Kind by Kyma-Incubator (https://registry.terraform.io/providers/kyma-incubator/kind/latest);
