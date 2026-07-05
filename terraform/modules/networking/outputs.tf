output "vpc_id" {
  description = " vpcv id "
  value       = aws_vpc.vpc.id
}
output "private_subnet_ids" {
  value = aws_subnet.private[*].id
}
output "public_subnet_ids" {
  value = aws_subnet.public[*].id
}