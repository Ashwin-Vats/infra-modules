# kOps S3 Module

## Description

Creates an S3 bucket used by kOps to store Kubernetes cluster state.

Includes:

- Versioning enabled
- KMS encryption
- Public access blocked

## Resources Created

- aws_s3_bucket
- aws_s3_bucket_versioning
- aws_s3_bucket_server_side_encryption_configuration
- aws_s3_bucket_public_access_block

## Inputs

| Name | Description | Type |
|------|-------------|------|
| env | Environment name | string |
| account_id | AWS account ID | string |
| region | AWS region | string |
| kms_key_arn | KMS key ARN | string |

## Outputs

| Name | Description |
|------|-------------|
| kops_state_bucket_name | Bucket name |
| kops_state_bucket_arn | Bucket ARN |

## Example Usage

```hcl
module "kops_s3" {
  source = "../../infra-modules/kops-s3"

  env = "dev"

  account_id = data.aws_caller_identity.current.account_id

  region = "ap-south-1"

  kms_key_arn = module.kms.kms_key_arn
}