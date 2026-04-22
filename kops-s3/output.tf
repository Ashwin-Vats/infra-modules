output "kops_state_bucket_name" {
  description = "kOps state bucket name"
  value       = aws_s3_bucket.kops_state.bucket
}

output "kops_state_bucket_arn" {
  description = "kOps state bucket ARN"
  value       = aws_s3_bucket.kops_state.arn
}