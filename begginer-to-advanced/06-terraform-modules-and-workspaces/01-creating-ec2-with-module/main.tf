module "ec2-instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "6.1.5"
}

variable "security_group_id" {}

variable "cidr_block" {
  default = "10.0.1.0/24"
}

data "aws_security_group" "sg" {
  id = var.security_group_id
}

resource "aws_subnet" "subnet" {
  vpc_id     = data.aws_security_group.selected.vpc_id
  cidr_block = var.cidr_block
}

module "ec2_instance" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name = "single-instance"

  instance_type = "t3.micro"
  key_name      = "user1"
  monitoring    = true
  subnet_id     = data.aws_security_group.sg.vpc_id.subnets[0]

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}