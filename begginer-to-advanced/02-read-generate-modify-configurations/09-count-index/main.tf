resource "aws_instance" "ec2" {
  ami           = var.ami
  instance_type = var.instance_type
  count         = 3

  tags = {
    Name = "database-${count.index}"
  }
}

resource "aws_instance" "database" {
  ami           = var.ami
  instance_type = var.instance_type
  count         = 3

  tags = {
    Name = var.database-name[count.index]
  }
}