# Addons IRSA Module

Creates IRSA roles for Kubernetes addons.

## Roles Created

- external-dns
- cert-manager
- cluster-autoscaler

## Policies Attached

- AmazonRoute53FullAccess
- AutoScalingFullAccess

## Inputs

| Name | Type |
|------|------|
| env | string |
| oidc_provider_arn | string |
| oidc_provider_url | string |

## Outputs

| Name | Description |
|------|-------------|
| external_dns_irsa_role | External DNS Role ARN |
| cert_manager_irsa_role | Cert Manager Role ARN |
| autoscaler_irsa_role | Autoscaler Role ARN |