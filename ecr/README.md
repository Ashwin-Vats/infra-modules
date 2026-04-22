# ECR Module

Creates an Elastic Container Registry repository.

## Resources Created

- ECR Repository
- Lifecycle Policy

## Features

- Image scanning enabled
- Old images auto-cleaned

## Inputs

| Name | Description | Type |
|------|-------------|------|
| env | Environment name | string |
| repository_name | Repository name | string |

## Outputs

| Name | Description |
|------|-------------|
| repository_url | ECR URL |
| repository_arn | ECR ARN |

## Example Usage

```hcl
module "ecr" {
  source = "../../infra-modules/ecr"

  env = "dev"

  repository_name = "app"
}