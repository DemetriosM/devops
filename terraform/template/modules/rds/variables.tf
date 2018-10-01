variable "allocated_storage" {
  description = "DB allocated storage"
  default = 5
}
variable "backup_retention_period" {
  description = "DB backup retention period"
  default = 0
}
variable "db_name" {
  description = "DB name"
  default = ""
}
variable "db_password" {
  description = "DB password"
  default = ""
}
variable "db_user" {
  description = "DB user name"
  default = ""
}
variable "engine" {
  description = "DB engine"
  default = "mysql"
}
variable "engine_version" {
  description = "DB engine version"
  default = "5.7"
}
variable "instance_class" {
  description = "DB instance class"
  default = "db.t2.micro"
}
variable "name" {
  description = "Name to be used on all resources as prefix"
  default = "Test"
}
variable "private_subnet_ids" {
  description = "Subnets for RDS"
  type = "list"
  default = []
}
variable "vpc_security_group_ids" {
  description = "DB vpc security group ids"
  type = "list"
  default = []
}

