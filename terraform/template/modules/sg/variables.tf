# Global or/and default variables
variable "name" {
  description = "Name to be used on all resources as prefix"
  default     = "Test"
}
variable "ports" {
  description = "Allowed ports from/to host"
  type        = "list"
}
variable "vpc_id" {
  description = "VPC id"
}

