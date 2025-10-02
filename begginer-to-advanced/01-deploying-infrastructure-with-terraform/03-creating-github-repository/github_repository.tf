terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
}

provider "github" {
  token = "token"
}

resource "github_repository" "terraform" {
  name        = "terraform_repo"
  description = "Criando repositório com terraform"

  visibility = "private"
}