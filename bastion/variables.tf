variable "env" {
  description = "Environment name"
  type        = string
}

variable "public_subnets" {
  description = "Public subnet IDs"
  type        = list(string)
}

variable "bastion_sg_id" {
  description = "Security group ID for bastion"
  type        = string
}

variable "key_name" {
  description = "SSH key pair name"
  type        = string
}