variable "bucket_name" {
  description = "Terraform state bucket name"
  type        = string
}

variable "dynamodb_table_name" {
  description = "Terraform lock table name"
  type        = string
}

variable "kms_key_alias" {
  description = "KMS alias name"
  type        = string
}