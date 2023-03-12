resource "aws_subnet" "public_subnet_1" {
  vpc_id = aws_vpc.eks_vpc.id

  cidr_block = "10.0.1.0/24"

  map_public_ip_on_launch = true

  availability_zone = "eu-west-1a"

  tags = {
    "terraform"                 = "true"
    Name                        = "public_subnet_1"
    "kubernetes.io/cluster/eks_cluster" = "shared"
    "kubernetes.io/role/elb"    = 1
  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id = aws_vpc.eks_vpc.id

  cidr_block = "10.0.2.0/24"

  map_public_ip_on_launch = true

  availability_zone = "eu-west-1b"

  tags = {
    "terraform"                 = "true"
    Name                        = "public_subnet_2"
    "kubernetes.io/cluster/eks_cluster" = "shared"
    "kubernetes.io/role/elb"    = 1
  }
}

resource "aws_subnet" "private_subnet_1" {
  vpc_id = aws_vpc.eks_vpc.id

  cidr_block = "10.0.3.0/24"

  availability_zone = "eu-west-1a"

  tags = {
    "terraform"                               = "true"
    Name                                      = "private_subnet_1"
    "kubernetes.io/cluster/eks_cluster"       = "shared"
    "kubernetes.io/role/internal-elb"         = 1
  }
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id = aws_vpc.eks_vpc.id

  cidr_block = "10.0.4.0/24"

  availability_zone = "eu-west-1b"

  tags = {
    "terraform"                               = "true"
    Name                                      = "private_subnet_2"
    "kubernetes.io/cluster/eks_cluster"       = "shared"
    "kubernetes.io/role/internal-elb"         = 1
  }
}