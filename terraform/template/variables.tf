#Total
variable "access_key" {}
variable "secret_key" {}
variable "region" {
  description = "AWS region"
  default     = "us-east-1"
}
variable "project_name" {
  description = "Project name"
  default     = "wordpress"
}

#VPC
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
variable "vpc_cidr" {
  description = "VPC CIDR"
  default     = "10.0.0.0/16"
}
variable "vpc_zones" {
  description = "Avialability zones"
  type        = "list"
  default     = ["us-east-1a", "us-east-1b"]
}

#SG
variable "ports" {
  description = "Allowed ports from/to host"
  type        = "list"
  default     = ["80","443","22","3306"]
}

#DB
variable "allocated_storage" {
  description = "DB allocated storage"
  default     = 5
}
variable "backup_retention_period" {
  description = "DB backup retention period"
  default     = 0
}
variable "db_name" {
  description = "DB name"
}
variable "db_password" {
  description = "DB password"
}
variable "db_user" {
  description = "DB user name"
}
variable "engine" {
  description = "DB engine"
  default     = "mysql"
}
variable "engine_version" {
  description = "DB engine version"
  default     = "5.7"
}
variable "instance_class" {
  description = "DB instance class"
  default     = "db.t2.micro"
}
variable "skip_final_snapshot" {
  description = "skip final snapshot for DB"
  default     = true
}

#EC2
variable "ami" {
  description = "AWS EC2 image id"
  default     = "ami-04169656fea786776"
}
variable "associate_public_ip_address" {
  description = "Is EC2 associating with public ip address"
  default     = false
}
variable "instance_type" {
  description = "AWS EC2 instance type"
  default     = "t2.micro"
}
variable "key_name" {
  description = "instance key pair name"
  default     = "learn-aws-wp"
}