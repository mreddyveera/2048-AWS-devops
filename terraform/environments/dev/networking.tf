module "networking" {
  source               = "../../modules/networking"
  project_name         = var.project_name
  environment          = var.environment
  vpc_cidr             = var.vpc_cidr
  common_tags          = var.common_tags
  networking_tags      = var.vpc_tags
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  is_peering_required  = var.is_peering_required
  availability_zones   = var.availability_zones

  #Public subnet
  public_subnet_tags = var.public_subnet_tags


  #Private subnet
  private_subnet_tags = var.private_subnet_tags

  #Internet gateway
  igw_tags = var.igw_tags

  #eip
  eip_tags = var.eip_tags

  #natgateway
  nat_gateway_tags = var.nat_gate_way_tags

  #publicsubnet
  public_route_table_tags = var.public_route_table_tags

}

