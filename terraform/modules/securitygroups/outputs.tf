output "ecs_security_group_ids" {
  value = aws_security_group.ecs_sg[*].id
}
output "public_alb_sg_ids" {
  value = aws_security_group.public_alb_sg[*].id
}