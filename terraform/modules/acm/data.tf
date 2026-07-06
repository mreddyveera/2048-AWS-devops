data "aws_route53_zone" "main" {
  name         = "manikanta.space"
  private_zone = false
}