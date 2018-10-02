variable "ami" {
  description = "AWS EC2 image id"
}
variable "associate_public_ip_address" {
  description = "Is EC2 associating with public ip address"
}
variable "db_host" {
  description = "DB host"
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
variable "instance_type" {
  description = "AWS EC2 instance type"
}
variable "key_name" {
  description = "instance key pair name"
}
variable "name" {
  description = "Name to be used on all resources as prefix"
}
variable "subnet_id" {
  description = "Subnet for EC2"  
}
variable "vpc_security_group_ids" {
  description = "vpc security group ids"
  type        = "list"
  default     = []
}
