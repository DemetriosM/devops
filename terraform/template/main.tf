provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}

module "rds" {
  source = "./modules/rds"
  vpc_security_group_ids = ["sg-0bd783aad621445de"]
  db_name                = "${var.db_name}"
  db_user                = "${var.db_user}"
  db_password            = "${var.db_password}"
  db_subnet_group_name   = "wordpress-dbsubnetgroup-1qos1lplht6fg"
}
module "ec2" {
  source = "./modules/ec2"
  key_name               = "learn-aws-wp"
  vpc_security_group_ids = ["sg-0bd783aad621445de"]
  db_host                = "${module.rds.db_host}"
  db_name                = "${var.db_name}"
  db_user                = "${var.db_user}"
  db_password            = "${var.db_password}"
}
