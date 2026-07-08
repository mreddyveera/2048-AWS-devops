module "monitoring" {
  source                      = "../../modules/monitoring"
  project_name                = var.project_name
  common_tags                 = var.common_tags
  alert_email                 = var.alert_email
  ecs_cluster_name            = module.ecs.ecs_cluster_name
  ecs_service_name            = module.ecs.ecs_service_name
  aws_lb_arn_suffix           = module.ecs.aws_lb_arn_suffix
  aws_target_group_arn_suffix = module.ecs.aws_lb_target_group_arn_suffix
}