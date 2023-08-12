output "ng_id" {
  value = aws_nat_gateway.NG.id
}

output "ig_id" {
    value = aws_internet_gateway.IG.id
}
