/*

1. tfenv use 0.12.31 para usar a versão antiga declarada aqui
2. terraform init para instalar plugins
3. terraform fmt para formatar o arquivo
4. terraform plan
5. utilizei o aws cli para guardar credenciais, mas poderia ter colocado no arquivo

==== VERSÃO ANTIGA ====

provider "aws" {
  version    = "~> 2.54"
  region     = "us-east-1"
  access_key = "key"
  secret_key = "key"
}

provider "digitalocean" {}

terraform {
  required_version = "0.12.31"
}


resource "aws_eip" "kplabs_app_ip" {
  vpc = true
}

*/

terraform {
  required_version = "1.14.2"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

provider "digitalocean" {}

resource "aws_eip" "kplabs_app_ip" {
  domain = "vpc"
}