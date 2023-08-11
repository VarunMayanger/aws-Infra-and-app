resource "aws_route_table" "RT1" {
    vpc_id = aws_vpc.my-vpc2.id

    route{
        gateway_id = aws_internet_gateway.IG.id
        cidr_block = "0.0.0.0/0" 
    }
}

resource "aws_route_table_association" "RTA" {
   route_table_id = aws_route_table.RT1.id
   subnet_id = aws_subnet.pubsubnet1.id
}
resource "aws_route_table" "RT2" {
    vpc_id = aws_vpc.my-vpc2.id

    route{
        gateway_id = aws_nat_gateway.NG.id
        cidr_block = "0.0.0.0/0" 
    }
}

resource "aws_route_table_association" "RTA2" {
   route_table_id = aws_route_table.RT2.id
   subnet_id = aws_subnet.prvsubnet1.id
}