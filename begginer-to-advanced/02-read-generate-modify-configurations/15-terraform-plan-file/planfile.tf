/*---
  This Terraform configuration creates three AWS IAM users and outputs their ARNs.
  1. Use o comando terraform plan -out=planfile.tf para gerar um arquivo de plano.
  2. Use o comando terraform apply planfile.tf para aplicar o plano salvo.
---*/

provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_user" "users" {
  name  = "user-${count.index}"
  count = 3
}

output "arn_users" {
  value = aws_iam_user.users[*].arn
}