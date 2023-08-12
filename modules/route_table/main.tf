resource "aws_route_table" "RT1" {
    vpc_id = var.vpc_id

    route{
        gateway_id = var.ig_id
        cidr_block = "0.0.0.0/0" 
    }
}

resource "aws_route_table_association" "RTA" {
   route_table_id = aws_route_table.RT1.id
   subnet_id = var.public_subnet
}
resource "aws_route_table" "RT2" {
    vpc_id = var.vpc_id

    route{
        gateway_id = var.ng_id
        cidr_block = "0.0.0.0/0" 
    }
}

resource "aws_route_table_association" "RTA2" {
   route_table_id = aws_route_table.RT2.id
   subnet_id = var.private_subnet
}