resource "aws_nat_gateway" "nat-gw-1" {
  allocation_id = aws_eip.elastic-ip-nat-1.id

  subnet_id = aws_subnet.public_subnet_1.id
}

resource "aws_nat_gateway" "nat-gw-2" {
  allocation_id = aws_eip.elastic-ip-nat-2.id

  subnet_id = aws_subnet.public_subnet_2.id
}