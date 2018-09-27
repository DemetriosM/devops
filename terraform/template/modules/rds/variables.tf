variable "allocated_storage" {
  description = "DB allocated storage"
  default = 5
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
variable "backup_retention_period" {
  description = "DB backup retention period"
  default = 0
}
variable "db_name" {
  description = "DB name"
  default = ""
}
variable "db_user" {
  description = "DB user name"
  default = ""
}
variable "db_password" {
  description = "DB password"
  default = ""
}
variable "vpc_security_group_ids" {
  description = "DB vpc security group ids"
  type = "list"
  default = []
}
variable "av_z" {
  description = "DB availability zone"
  type = "list"
  default = ["us-east-1a", "us-east-1b"]
}
variable "db_subnet_group_name" {
  description = "DB subnet group name"
}