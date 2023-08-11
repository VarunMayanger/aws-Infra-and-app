resource "aws_vpc" "my-vpc2" {
  instance_tenancy = "default"
  tags = {
    name = "mynewvpc"
    environment = "Dev"
    backup = "24"
    owner = "ICode"
    pacecode = "ABS1234"

  }
  cidr_block = var.myvpc
}