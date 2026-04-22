# ArgoCD IAM Module

Creates IAM role for ArgoCD using IRSA.

## Resources Created

- IAM Role
- IAM Policy
- Role Attachment

## Inputs

| Name | Type |
|------|------|
| env | string |
| oidc_provider_arn | string |
| oidc_provider_url | string |

## Outputs

| Name | Description |
|------|-------------|
| argocd_role_arn | ArgoCD Role ARN |