provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "terraform-firewall" {
  name        = "terraform-firewall"
  description = "Security Group to study Terraform provisioning of Firewall"
}

resource "aws_vpc_security_group_ingress_rule" "firewall-ingress-rule" {
  security_group_id = aws_security_group.terraform-firewall.id

  cidr_ipv4   = "10.0.0.0/8"
  from_port   = 80
  ip_protocol = "tcp"
  to_port     = 80
}


resource "aws_vpc_security_group_egress_rule" "firewall-egress-rule" {
  security_group_id = aws_security_group.terraform-firewall.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}