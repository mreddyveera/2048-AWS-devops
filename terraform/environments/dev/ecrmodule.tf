module "ecr" {
  source                  = "../../modules/ecrregistry"
  deletion_window_in_days = var.deletion_window_in_days
  enable_key_rotation     = var.enable_key_rotation
}