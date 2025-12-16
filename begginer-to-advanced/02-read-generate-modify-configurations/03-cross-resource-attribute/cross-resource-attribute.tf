provider "aws" {
  region = "us-east-1"
}

resource "aws_eip" "elastic_ip" {
  domain = "vpc"
}

resource "aws_security_group" "security_group" {
  name        = "security-group"
  description = "Regras de Firewall"

  tags = {
    Name = "SG Terraform"
  }
}

resource "aws_vpc_security_group_ingress_rule" "sg_ingress" {
  security_group_id = aws_security_group.security_group.id
  cidr_ipv4         = "${aws_eip.elastic_ip.public_ip}/32"
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}


