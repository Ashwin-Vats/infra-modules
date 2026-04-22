# Node IAM Module

Creates IAM role and instance profile for Kubernetes worker nodes.

## Resources Created

- IAM Role
- Instance Profile
- Policy Attachments

## Policies Attached

- AmazonEKSWorkerNodePolicy
- AmazonEKS_CNI_Policy
- AmazonEC2ContainerRegistryReadOnly

## Inputs

| Name | Type |
|------|------|
| env | string |

## Outputs

| Name | Description |
|------|-------------|
| node_role_arn | Node IAM Role ARN |
| node_instance_profile | Instance Profile Name |