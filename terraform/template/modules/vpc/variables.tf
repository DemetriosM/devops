# Global or/and default variables
variable "assign_generated_ipv6_cidr_block" {
    description = "Generation IPv6"
    default     = "false"
}
variable "enable_classiclink" {
    description = "Enabling classiclink"
    default     = "false"
}
variable "enable_dns_hostnames" {
    description = "Enabling dns hostnames"
    default     = "true"
}
variable "enable_dns_support" {
    description = "Enabling dns support"
    default     = "true"
}
variable "instance_tenancy" {
    description = "instance tenancy"
    default     = "default"
}
variable "name" {
  description = "Name to be used on all resources as prefix"
  default     = "test"
}

# Custom variables
variable "vpc_cidr" {
    description = "CIDR for the whole VPC"
}
variable "vpc_zones" {
    description = "List of availability zones in the region"
    type        = "list"
    default     = []
}
