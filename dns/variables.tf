variable "env" {
  description = "Environment name"
  type        = string
}

variable "domain_name" {
  description = "Private DNS domain name"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID to associate with Route53 private hosted zone"
  type        = string
}