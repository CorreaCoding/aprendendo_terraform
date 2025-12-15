variable "ports" {
  type    = list(number)
  default = [8200, 8201, 8300]
}

resource "aws_security_group" "demo_sg_dynamic" {
  name = "demo_sg-dynamic"

  dynamic "ingress" {
    for_each = var.ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]

    }
  }
}