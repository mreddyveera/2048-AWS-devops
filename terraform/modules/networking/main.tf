resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = var.enable_dns_hostnames
  instance_tenancy     = "default"
  enable_dns_support   = true


  # expense-dev
  tags = merge(
    var.common_tags,
    var.networking_tags,
    {
      Name = local.resource_name
    }
  )
}

resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.vpc.id
  count             = length(var.public_subnet_cidrs)
  cidr_block        = var.public_subnet_cidrs[count.index]
  availability_zone = var.availability_zones[count.index]
  map_public_ip_on_launch = true
  tags = merge(
    var.public_subnet_tags,
    var.common_tags,
    {
    Name = "public-subnet-${count.index + 1}"
  }
  )
}

resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.vpc.id
  count             = length(var.private_subnet_cidrs)
  cidr_block        = var.private_subnet_cidrs[count.index]
  availability_zone = var.availability_zones[count.index]

  tags = merge(
    var.private_subnet_tags,
    var.common_tags,
    {
    Name = "private-subnet-${count.index + 1}"
  }
  )
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = merge(
    var.common_tags,
    var.igw_tags
  )
}

resource "aws_eip" "eip" {
  count = length(var.public_subnet_cidrs)

  domain = "vpc"

  tags = merge(
    var.common_tags,
    var.eip_tags,
    {
      Name = "nat-eip-${count.index + 1}"
    }
  )
}

resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.eip[count.index].id
  count         = length(var.public_subnet_cidrs)
  subnet_id     = aws_subnet.public[count.index].id

  tags = merge(
    var.common_tags,
    var.nat_gateway_tags,
    {
      Name = "nat-gateway-${count.index + 1}"
  })
  depends_on = [aws_internet_gateway.igw]
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = var.public_route_table_cidr_block
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = merge (
    var.common_tags,
    var.public_route_table_tags,
    {
      Name = "public_route_table"
    }
  )
}

resource "aws_route_table_association" "public_subnet_association" {
  count = length(var.public_subnet_cidrs)
  subnet_id      = aws_subnet.public[count.index].id   # attach RT to this subnet
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table" "private_route_table" {
  count = length(var.private_subnet_cidrs)

  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway[count.index].id
  }

  tags = merge(
    var.common_tags,
    {
      Name = "private-rt-${count.index + 1}"
    }
  )
}

resource "aws_route_table_association" "private_route_table_association" {
  count = length(var.private_subnet_cidrs)

  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private_route_table[count.index].id
}