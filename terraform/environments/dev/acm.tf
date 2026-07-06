module "acm" {
  source       = "../../modules/acm"
  project_name = var.project_name
  domain_name  = var.domain_name
  common_tags  = var.common_tags
}