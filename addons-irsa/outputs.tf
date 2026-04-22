output "external_dns_irsa_role" {
  value = aws_iam_role.external_dns.arn
}

output "cert_manager_irsa_role" {
  value = aws_iam_role.cert_manager.arn
}

output "autoscaler_irsa_role" {
  value = aws_iam_role.cluster_autoscaler.arn
}
