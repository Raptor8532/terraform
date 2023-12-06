resource "aws_internet_gateway" "eks_gw" {
  vpc_id = aws_vpc.eks_vpc.id
}

resource "aws_subnet" "public_1" {
  vpc_id               = aws_vpc.eks_vpc.id
  cidr_block           = "192.168.0.0/18"
  availability_zone_id = "euw3-az1"
  # Required for EKS. Instances launched into the public subnet should be assign a public ip.
  map_public_ip_on_launch = true
  tags = {
    Name                        = "public-euw3-az1"
    "kubernetes.io/cluster/labs_eks" = "shared"
    "kubernetes.io/role/elb"    = 1
  }
}

resource "aws_subnet" "public_2" {
  vpc_id               = aws_vpc.eks_vpc.id
  cidr_block           = "192.168.64.0/18"
  availability_zone_id = "euw3-az2"

  # Required for EKS. Instances launched into the public subnet should be assign a public ip.
  map_public_ip_on_launch = true
  tags = {
    Name                        = "public-euw3-az2"
    "kubernetes.io/cluster/labs_eks" = "shared"
    "kubernetes.io/role/elb"    = 1
  }
}

resource "aws_subnet" "private_1" {
  vpc_id               = aws_vpc.eks_vpc.id
  cidr_block           = "192.168.128.0/18"
  availability_zone_id = "euw3-az1"
  tags = {
    Name                              = "private-eu-west-3a"
    "kubernetes.io/cluster/labs_eks"       = "shared"
    "kubernetes.io/role/internal-elb" = 1
  }
}

resource "aws_subnet" "private_2" {
  vpc_id               = aws_vpc.eks_vpc.id
  cidr_block           = "192.168.192.0/18"
  availability_zone_id = "euw3-az2"
  tags = {
    Name                              = "private-euw3-az2"
    "kubernetes.io/cluster/labs_eks"       = "shared"
    "kubernetes.io/role/internal-elb" = 1
  }
}

resource "aws_eip" "nat1" {
  depends_on = [aws_internet_gateway.eks_gw]
}

resource "aws_eip" "nat2" {
  depends_on = [aws_internet_gateway.eks_gw]
}

