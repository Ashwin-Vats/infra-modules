output "kops_bucket_name" {
  value = aws_s3_bucket.kops_state.bucket
}