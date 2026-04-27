output "kops_access_key_id" {
  value     = aws_iam_access_key.kops.id
  sensitive = true
}

output "kops_secret_access_key" {
  value     = aws_iam_access_key.kops.secret
  sensitive = true
}

output "external_dns_role_arn" {
  value = aws_iam_role.external_dns.arn
}

output "cert_manager_role_arn" {
  value = aws_iam_role.cert_manager.arn
}

output "cluster_autoscaler_role_arn" {
  value = aws_iam_role.cluster_autoscaler.arn
}

output "argocd_repo_server_role_arn" {
  value = aws_iam_role.argocd_repo_server.arn
}

output "node_instance_profile_arn" {
  value = aws_iam_instance_profile.node.arn
}