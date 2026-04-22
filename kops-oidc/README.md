# kOps OIDC Module

Creates IAM OpenID Connect provider used for Kubernetes IRSA.

## Inputs

| Name | Type |
|------|------|
| env | string |
| cluster_name | string |

## Outputs

| Name | Description |
|------|-------------|
| oidc_provider_arn | OIDC ARN |
| oidc_provider_url | OIDC URL |