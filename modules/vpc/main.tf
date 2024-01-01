resource "aws_vpc" "my_vpc2" {
  instance_tenancy = "default"
  tags = {
    name = "mynewvpc"
    environment = "Dev"
    backup = "24"
    owner = "ICode"
    casecode = "ABS1234"
  }
  cidr_block = var.myvpc
}
