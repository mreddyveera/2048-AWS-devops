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
resource "aws_flow_log" "example" {
  iam_role_arn    = "arn"
  log_destination = "log"
  traffic_type    = "ALL"
  vpc_id          = aws_vpc.vpc.id
}

resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.vpc.id
  count             = length(var.public_subnet_cidrs)
  cidr_block        = var.public_subnet_cidrs[count.index]
  availability_zone = var.availabilty_zones[count.index]
  tags = merge(
    var.public_subnet_tags,
    var.common_tags
  )
}

resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.vpc.id
  count             = length(var.private_subnet_cidrs)
  cidr_block        = var.private_subnet_cidrs[count.index]
  availability_zone = var.availabilty_zones[count.index]

  tags = merge(
    var.private_subnet_tags,
    var.common_tags
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

resource "aws_default_security_group" "default" {
  vpc_id = aws_vpc.vpc.id

  ingress = []
  egress  = []

  tags = {
    Name = "security_group-default-sg"
  }
}
resource "aws_cloudwatch_log_group" "vpc_flow_logs" {
  name = "/aws/vpc-flowlogs/dev"
}
resource "aws_iam_role" "vpc_flow_log_role" {
  name = "vpc-flow-log-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "vpc-flow-logs.amazonaws.com"
      }
    }]
  })
}
