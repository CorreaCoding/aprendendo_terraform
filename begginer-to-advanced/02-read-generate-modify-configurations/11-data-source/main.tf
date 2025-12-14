provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "database" {
  ami           = data.aws_ami.myimage.id
  instance_type = "t3.micro"
}

data "aws_ami" "myimage" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["*Linux*"]
  }

}