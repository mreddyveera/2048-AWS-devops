module "ecs" {
  source                 = "../../modules/ecsservice"
  common_tags            = var.common_tags
  project_name           = var.project_name
  repository_url         = module.ecr.repository_url
  desired_count          = var.desired_count
  private_subnet_ids     = module.networking.private_subnet_ids
  ecs_security_group_ids = module.securitygroups.ecs_security_group_ids
  vpc_id                 = module.networking.vpc_id
  public_alb_sg_ids      = module.securitygroups.public_alb_sg_ids
  public_subnet_ids      = module.networking.public_subnet_ids
}