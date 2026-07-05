variable "project_name" {
}
variable "common_tags" {
}
variable "ecs_tags" {
  type = map(string)
  default = {
    name = "2048-ecs-service"
  }

}
variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "repository_url" {
}
variable "desired_count" {
}
variable "private_subnet_ids" {
}
variable "ecs_security_group_ids" {
}
variable "vpc_id" {

}
variable "public_alb_sg_ids" {

}
variable "public_subnet_ids" {}