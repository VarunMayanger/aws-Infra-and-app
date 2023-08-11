resource "aws_subnet" "pubsubnet1" {
    vpc_id = aws_vpc.my-vpc2.id
    cidr_block = var.pubsubnet  
    tags = {
    Name        = "My public subnet"
    Environment = "Dev"
    purpose = "UI"
    Owner = " LL"
    Backup = "7"
    pacecode = "ABS1234"
  }
}

resource "aws_subnet" "prvsubnet1" {
    vpc_id = aws_vpc.my-vpc2.id
    cidr_block =  var.prvsubnet
    tags = {
    Name        = "My private subnett"
    Environment = "Dev"
    purpose = "UI"
    Owner = " LL"
    Backup = "7"
    pacecode = "ABS1234"
  }
    }
