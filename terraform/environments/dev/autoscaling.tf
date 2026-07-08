module "autoscaling" {
  source       = "../../modules/autoscaling"
  project_name = var.project_name
  cluster_name = module.ecs.ecs_cluster_name
  service_name = module.ecs.ecs_service_name
}