provider "aws" {
  region     = "us-east-1"
  access_key = "key"
  secret_key = "key"
}

resource "aws_instance" "myec2" {
  ami                     = "ami-052064a798f08f0d3"
  instance_type           = "t2.micro"
}