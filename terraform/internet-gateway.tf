resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.eks_vpc.id

  tags = {
    "terraform" = "true"
  }
}