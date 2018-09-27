# Global or/and default variables
variable "name" {
  description = "Name to be used on all resources as prefix"
  default     = "TEST"
}

variable "instance_tenancy" {
    description = "instance tenancy"
    default     = "default"
}

variable "enable_dns_support" {
    description = "Enabling dns support"
    default     = "true"
}

variable "enable_dns_hostnames" {
    description = "Enabling dns hostnames"
    default     = "true"
}

variable "assign_generated_ipv6_cidr_block" {
    description = "Generation IPv6"
    default     = "false"
}

variable "enable_classiclink" {
    description = "Enabling classiclink"
    default     = "false"
}

variable "environment" {
    description = "Environment for service"
    default     = "STAGE"
}

variable "orchestration" {
    description = "Type of orchestration"
    default     = "Terraform"
}

variable "createdby" {
    description = "Created by"
    default     = "DM"
}

# Custom variables
variable "allowed_ports" {
  description = "Allowed ports from/to host"
  type        = "list"
}

variable "enable_all_egress_ports" {
    description = "Allows all ports from host"
    default     = false
}
variable "vpc_cidr" {
    description = "CIDR for the whole VPC"
}
variable "subnet_cidrs" {
    description = "CIDR for the subnets"
    type        = "list"
    default     = []
}
variable "availability_zones" {
    description = "availability zones in the region"
    type        = "list"
    default     = []
}
