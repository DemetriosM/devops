variable "ami" {
  description = "AWS EC2 image id"
  default = "ami-04169656fea786776"
}
variable "instance_type" {
  description = "AWS EC2 instance type"
  default = "t2.micro"
}
variable "vpc_security_group_ids" {
  description = "vpc security group ids"
  type = "list"
  default = []
}
variable "key_name" {
  description = "instance key pair name"
}

variable "db_host" {
  description = "DB host"
  default = ""
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