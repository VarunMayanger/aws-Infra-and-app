resource "aws_internet_gateway" "IG" {
    vpc_id = aws_vpc.my-vpc2.id
    
}

resource "aws_eip" "eip1" {
    vpc = true
}

resource "aws_nat_gateway" "NG" {
    allocation_id = aws_eip.eip1.id
    subnet_id = aws_subnet.prvsubnet1.id
     }