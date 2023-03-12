resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.eks_vpc.id

  route {
    cidr_block = "0.0.0.0/0"

    gateway_id = aws_internet_gateway.internet_gateway.id
  }

  depends_on = [
    aws_internet_gateway.internet_gateway
  ]
}

resource "aws_route_table" "private_route_table-1" {
  vpc_id = aws_vpc.eks_vpc.id

  route {
    cidr_block = "0.0.0.0/0"

    nat_gateway_id = aws_nat_gateway.nat-gw-1.id
  }

  depends_on = [
    aws_nat_gateway.nat-gw-1
  ]
}

resource "aws_route_table" "private_route_table-2" {
  vpc_id = aws_vpc.eks_vpc.id

  route {
    cidr_block = "0.0.0.0/0"

    nat_gateway_id = aws_nat_gateway.nat-gw-2.id
  }

  depends_on = [
    aws_nat_gateway.nat-gw-2
  ]
}

resource "aws_route_table_association" "public-route-1" {
  subnet_id = aws_subnet.public_subnet_1.id

  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "public-route-2" {
  subnet_id = aws_subnet.public_subnet_2.id

  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "private-route-1" {
  subnet_id = aws_subnet.private_subnet_1.id

  route_table_id = aws_route_table.private_route_table-1.id
}

resource "aws_route_table_association" "private-route-2" {
  subnet_id = aws_subnet.private_subnet_2.id

  route_table_id = aws_route_table.private_route_table-2.id
}