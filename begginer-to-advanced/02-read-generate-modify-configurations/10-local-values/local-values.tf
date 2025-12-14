
# Can add expressions, allowing us to compute values dynamically
locals {
  default = {
    Team = "security-team"
    Date = formatdate("DD-MM-YYYY", timestamp())
  }
}

resource "aws_security_group" "sg-01" {
  name = "app-firewall"
  tags = local.default
}

resource "aws_security_group" "sg-02" {
  name = "database-firewall"
  tags = local.default
}