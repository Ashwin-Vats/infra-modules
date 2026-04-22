output "external_dns_role_arn" {
  value = aws_iam_role.external_dns.arn
}

output "cert_manager_role_arn" {
  value = aws_iam_role.cert_manager.arn
}

output "autoscaler_role_arn" {
  value = aws_iam_role.autoscaler.arn
}

output "alb_controller_role_arn" {
  value = aws_iam_role.alb_controller.arn
}