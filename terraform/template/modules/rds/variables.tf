variable "allocated_storage" {
  description = "DB allocated storage"
}
variable "backup_retention_period" {
  description = "DB backup retention period"
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
}
variable "engine_version" {
  description = "DB engine version"
}
variable "instance_class" {
  description = "DB instance class"
}
variable "name" {
  description = "Name to be used on all resources as prefix"
}
variable "private_subnet_ids" {
  description = "Subnets for RDS"
  type        = "list"
  default     = []
}
variable "skip_final_snapshot" {
  description = "skip final snapshot for DB"
}

variable "vpc_security_group_ids" {
  description = "DB vpc security group ids"
  type        = "list"
  default     = []
}

