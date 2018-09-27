#Total
variable "access_key" {}
variable "secret_key" {}
variable "region" {
  description = "AWS region"
  default = "us-east-1"
}
#DB
variable "db_name" {
  description = "DB name"
}
variable "db_user" {
  description = "DB user name"
}
variable "db_password" {
  description = "DB password"
}