resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr
  enable_dns_hostnames = var.enable_dns_hostnames
  instance_tenancy = "default"
  enable_dns_support=true
  

  # expense-dev
  tags = merge(
    var.common_tags,
    var.networking_tags,
    {
        Name = local.resource_name
    }
  )
}