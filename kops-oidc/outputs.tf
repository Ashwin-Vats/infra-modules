output "oidc_provider_arn" {
  value = aws_iam_openid_connect_provider.kops.arn
}

output "oidc_provider_url" {
  value = aws_iam_openid_connect_provider.kops.url
}