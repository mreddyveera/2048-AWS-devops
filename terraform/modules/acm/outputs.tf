output "certificate_arn" {
  value = aws_acm_certificate.certificate_2048.arn
}

output "domain_validation_options" {
  value = aws_acm_certificate.certificate_2048.domain_validation_options
}