output "ecs_execution_role_arn" {
  value = aws_iam_role.ecs_execution_role.arn
}
output "ecs_cluster_name" {
  value = aws_ecs_cluster.ecs_cluster_2048.name
}
output "ecs_service_name" {
  value = aws_ecs_service.ecs_service_2048.name
}
output "aws_lb_arn_suffix" {
  value = aws_lb.lb_2048.arn_suffix
}
output "aws_lb_target_group_arn_suffix" {
  value = aws_lb_target_group.ecs_tg.arn_suffix
}