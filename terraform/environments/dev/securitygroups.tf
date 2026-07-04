module "securitygroups" {
  source                  = "../../modules/securitygroups"
  vpc_id                  = module.networking.vpc_id
  common_tags             = var.common_tags
  alb_security_group_tags = var.alb_security_group_tags
  ecs_security_group_tags = var.ecs_security_group_tags
}