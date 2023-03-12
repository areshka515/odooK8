resource "aws_eip" "elastic-ip-nat-1" {
  depends_on = [
    aws_internet_gateway.internet_gateway
  ]
}

resource "aws_eip" "elastic-ip-nat-2" {
  depends_on = [
    aws_internet_gateway.internet_gateway
  ]
}