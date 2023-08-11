resource "aws_internet_gateway" "IG" {
    vpc_id = var.vpc_id
    
}

resource "aws_eip" "eip1" {
    vpc = true
}

resource "aws_nat_gateway" "NG" {
    allocation_id = aws_eip.eip1.id
    subnet_id = var.pvt_subnet_id
     }