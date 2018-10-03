variable "assign_generated_ipv6_cidr_block" {
  description = "Generation IPv6"
}
variable "enable_dns_hostnames" {
  description = "Enabling dns hostnames"
}
variable "enable_dns_support" {
  description = "Enabling dns support"
}
variable "instance_tenancy" {
  description = "instance tenancy"
}
variable "name" {
  description = "Name to be used on all resources as prefix"
}

variable "vpc_cidr" {
  description = "CIDR for the whole VPC"
}
variable "vpc_zones" {
  description = "List of availability zones in the region"
  type        = "list"
  default     = []
}
