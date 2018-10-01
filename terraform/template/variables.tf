#Total
variable "access_key" {}
variable "secret_key" {}
variable "region" {
  description = "AWS region"
  default = "us-east-1"
}
variable "project_name" {
  description = "Project name"
  default = "wordpress"
}

#VPC
variable "vpc_cidr" {
  description = "VPC CIDR"
  default = "10.0.0.0/16"
}
variable "vpc_zones" {
  description = "Avialability zones"
  type        = "list"
  default     = ["us-east-1a", "us-east-1b"]
}

#DB
variable "db_name" {
  description = "DB name"
}
variable "db_password" {
  description = "DB password"
}
variable "db_user" {
  description = "DB user name"
}
