resource "aws_subnet" "pubsubnet1" {
    vpc_id = var.vpc_id
    cidr_block = var.pubsubnet  
    tags = {
    Name        = "My public subnet"
    Environment = "Dev"
    purpose = "UI"
    Owner = " LL"
    Backup = "7"
    casecode = "ABS1234"
  }
}

resource "aws_subnet" "prvsubnet1" {
    vpc_id = var.vpc_id
    cidr_block =  var.prvsubnet
    tags = {
    Name        = "My private subnett"
    Environment = "Dev"
    purpose = "UI"
    Owner = " LL"
    Backup = "7"
    casecode = "ABS1234"
  }
    }
