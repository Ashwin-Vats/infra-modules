# Cluster IAM Module

Creates IAM Roles for Kubernetes IRSA.

## Roles Created

- external-dns
- cert-manager
- cluster-autoscaler
- aws-load-balancer-controller

## Inputs

| Name | Type |
|------|------|
| env | string |
| cluster_name | string |
| oidc_provider_arn | string |
| oidc_provider_url | string |

## Outputs

| Name | Description |
|------|-------------|
| external_dns_role_arn | External DNS Role |
| cert_manager_role_arn | Cert Manager Role |
| autoscaler_role_arn | Autoscaler Role |
| alb_controller_role_arn | ALB Controller Role |