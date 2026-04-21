Creates:

- S3 bucket for Terraform state
- DynamoDB table for locking
- KMS encryption key

Usage:

module "backend" {
  source = "../../infra-modules/s3-backend"

  bucket_name          = "corp-terraform-state"
  dynamodb_table_name  = "terraform-locks"
  kms_key_alias        = "terraform-key"
}
