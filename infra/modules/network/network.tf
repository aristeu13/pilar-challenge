resource "aws_vpc" "pilar_vpc" {
  cidr_block = "10.0.0.0/16"

  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = format("%s-vpc", var.cluster_name)
  }
}

resource "aws_subnet" "subnet_public_1a" {
  vpc_id                  = aws_vpc.pilar_vpc.id
  cidr_block              = "10.0.3.0/24"
  availability_zone       = format("%sa", var.region)
  map_public_ip_on_launch = true

  tags = {
    Name                                        = format("%s-subnet-public-1a", var.cluster_name)
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
  }
}

resource "aws_subnet" "subnet_public_1b" {
  vpc_id                  = aws_vpc.pilar_vpc.id
  cidr_block              = "10.0.4.0/24"
  availability_zone       = format("%sb", var.region)
  map_public_ip_on_launch = true

  tags = {
    Name                                        = format("%s-subnet-public-1b", var.cluster_name)
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
  }
}

resource "aws_route_table_association" "public_rt_association_1a" {
  subnet_id      = aws_subnet.subnet_public_1a.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "eks_public_rt_association_1b" {
  subnet_id      = aws_subnet.subnet_public_1b.id
  route_table_id = aws_route_table.public_route_table.id
}


resource "aws_subnet" "subnet_private_1a" {
  vpc_id            = aws_vpc.pilar_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = format("%sa", var.region)

  tags = {
    Name                                        = format("%s-subnet-private-1a", var.cluster_name)
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
  }
}

resource "aws_subnet" "subnet_private_1b" {
  vpc_id            = aws_vpc.pilar_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = format("%sb", var.region)

  tags = {
    Name                                        = format("%s-subnet-private-1b", var.cluster_name)
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
  }
}

resource "aws_route_table_association" "eks_private_rt_association_1a" {
  subnet_id      = aws_subnet.subnet_private_1a.id
  route_table_id = aws_route_table.private_route_table.id
}

resource "aws_route_table_association" "eks_private_rt_association_1b" {
  subnet_id      = aws_subnet.subnet_private_1b.id
  route_table_id = aws_route_table.private_route_table.id
}

resource "aws_eip" "nat_eip" {
  domain = "vpc"

  tags = {
    Name = format("%s-nat-eip", var.cluster_name)
  }
}

resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.subnet_public_1a.id

  tags = {
    Name = format("%s-nat-gateway", var.cluster_name)
  }
}


resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.pilar_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway.id
  }

  tags = {
    Name = format("%s-private-rt", var.cluster_name)
  }
}


resource "aws_internet_gateway" "ig" {
  vpc_id = aws_vpc.pilar_vpc.id

  tags = {
    Name = format("%s-internet-gateway", var.cluster_name)
  }
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.pilar_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ig.id
  }

  tags = {
    Name = format("%s-public-rt", var.cluster_name)
  }
}
