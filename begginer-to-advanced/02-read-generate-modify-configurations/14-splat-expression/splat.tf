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