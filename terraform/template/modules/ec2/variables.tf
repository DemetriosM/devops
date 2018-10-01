variable "ami" {
  description = "AWS EC2 image id"
  default = "ami-04169656fea786776"
}
variable "associate_public_ip_address" {
  description = "Is EC2 associating with public ip address"
  default = false
}
variable "db_host" {
  description = "DB host"
  default = ""
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
variable "instance_type" {
  description = "AWS EC2 instance type"
  default = "t2.micro"
}
variable "key_name" {
  description = "instance key pair name"
}
variable "name" {
  description = "Name to be used on all resources as prefix"
  default = "Test"
}
variable "subnet_id" {
  description = "Subnet for EC2"  
}
variable "vpc_security_group_ids" {
  description = "vpc security group ids"
  type = "list"
  default = []
}
