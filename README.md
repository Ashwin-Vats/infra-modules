# infra-modules

This repository contains reusable Terraform modules for provisioning AWS infrastructure foundations for Kubernetes platforms.

## Modules

### s3-backend
Creates S3 bucket with DynamoDB table for Terraform remote state and locking.

**Inputs:**
- `bucket_name`: Name of the S3 bucket
- `dynamodb_table_name`: Name of the DynamoDB table
- `kms_key_alias`: Alias for the KMS key

**Outputs:**
- `bucket_name`: S3 bucket name
- `dynamodb_table_name`: DynamoDB table name
- `kms_key_arn`: KMS key ARN

**Example:**
```hcl
module "backend" {
  source = "./infra-modules/s3-backend"

  bucket_name         = "my-terraform-state"
  dynamodb_table_name = "my-terraform-locks"
  kms_key_alias       = "my-tf-key"
}
```

### vpc
Creates VPC with public and private subnets across multiple AZs, NAT gateways, and route tables.

**Inputs:**
- `env`: Environment name
- `vpc_cidr`: VPC CIDR block
- `azs`: List of availability zones
- `public_subnets`: List of public subnet CIDRs
- `private_subnets`: List of private subnet CIDRs

**Outputs:**
- `vpc_id`: VPC ID
- `public_subnets`: List of public subnet IDs
- `private_subnets`: List of private subnet IDs

**Example:**
```hcl
module "vpc" {
  source = "./infra-modules/vpc"

  env = "dev"
  vpc_cidr = "10.0.0.0/16"
  azs = ["us-east-1a", "us-east-1b", "us-east-1c"]
  public_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  private_subnets = ["10.0.11.0/24", "10.0.12.0/24", "10.0.13.0/24"]
}
```

### iam
Creates IAM roles and policies for kOps, IRSA, and Kubernetes components.

**Inputs:**
- `env`: Environment name
- `account_id`: AWS account ID
- `cluster_name`: Kubernetes cluster name

**Outputs:**
- `external_dns_role_arn`: External DNS IAM role ARN
- `cert_manager_role_arn`: Cert Manager IAM role ARN
- `cluster_autoscaler_role_arn`: Cluster Autoscaler IAM role ARN
- `argocd_repo_server_role_arn`: ArgoCD Repo Server IAM role ARN
- `node_instance_profile_arn`: Node instance profile ARN

**Example:**
```hcl
module "iam" {
  source = "./infra-modules/iam"

  env = "dev"
  account_id = "123456789012"
  cluster_name = "dev.cluster.local"
}
```

### kms
Creates KMS key for encryption.

**Inputs:**
- `env`: Environment name
- `account_id`: AWS account ID

**Outputs:**
- `kms_key_id`: KMS key ID
- `kms_key_arn`: KMS key ARN

**Example:**
```hcl
module "kms" {
  source = "./infra-modules/kms"

  env = "dev"
  account_id = "123456789012"
}
```

### dns
Creates Route53 private hosted zone.

**Inputs:**
- `env`: Environment name
- `domain_name`: Domain name
- `vpc_id`: VPC ID

**Outputs:**
- `zone_id`: Route53 zone ID
- `zone_name`: Route53 zone name

**Example:**
```hcl
module "dns" {
  source = "./infra-modules/dns"

  env = "dev"
  domain_name = "corp.example.internal"
  vpc_id = module.vpc.vpc_id
}
```

### kops-oidc
Creates OIDC provider for IRSA.

**Inputs:**
- `env`: Environment name
- `cluster_name`: Cluster name

**Outputs:**
- None

**Example:**
```hcl
module "kops_oidc" {
  source = "./infra-modules/kops-oidc"

  env = "dev"
  cluster_name = "dev.cluster.local"
}
```

### Other Modules
- `bastion`: EC2 bastion host
- `security_groups`: Security groups
- `kops-s3`: S3 bucket for kOps state
- `ecr`: ECR repository
- `node-iam`: Node IAM roles

## Requirements

- Terraform >= 1.5.0
- AWS provider ~> 5.0

## Usage

See the `infra-live/` repository for examples of using these modules in environment-specific stacks.


