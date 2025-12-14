provider "aws" {
  region = "us-east-1"
}

resource "aws_eip" "eip" {
  domain   = "vpc"
}

output "public-ip"{
    value = aws_eip.eip.public_ip
}