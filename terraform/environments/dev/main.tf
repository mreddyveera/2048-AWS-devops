module "VPC"{
    source= "../../modules/networking"
    project_name= var.project_name
    environment=var.environment
    vpc_cidr=var.vpc_cidr
    common_tags=var.common_tags
    networking_tags=var.networking_tags
    public_subnet_cidrs=var.public_subnet_cidrs
    private_subnet_cidrs=var.private_subnet_cidrs
    is_peering_required=var.is_peering_required

}