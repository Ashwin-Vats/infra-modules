# DNS Module

## Description

Creates a private Route53 hosted zone associated with a VPC.

Used by kOps for Kubernetes DNS resolution.

## Resources Created

- aws_route53_zone (Private Hosted Zone)

## Inputs

| Name | Description | Type |
|------|-------------|------|
| env | Environment name | string |
| domain_name | Private DNS domain | string |
| vpc_id | VPC ID to associate | string |

## Outputs

| Name | Description |
|------|-------------|
| zone_id | Route53 Hosted Zone ID |
| zone_name | Hosted Zone Name |

## Example Usage

```hcl
module "dns" {
  source = "../../infra-modules/dns"

  env = "dev"

  domain_name = "corp.example.internal"

  vpc_id = module.vpc.vpc_id
}