provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}

module "vpc" {
  source = "./modules/vpc"

  name       = "${var.project_name}"
  vpc_cidr   = "${var.vpc_cidr}"
  vpc_zones  = "${var.vpc_zones}"
}

module "sg" {
  source = "./modules/sg"
  
  name    = "${var.project_name}"
  ports   = ["80","443","22","3306"]
  vpc_id  = "${module.vpc.vpc_id}"
}

module "rds" {
  source = "./modules/rds"

  db_name                 = "${var.db_name}"
  db_user                 = "${var.db_user}"
  db_password             = "${var.db_password}"
  name                    = "${var.project_name}"
  private_subnet_ids      = ["${module.vpc.private_subnet_ids}"]
  vpc_security_group_ids  = ["${module.sg.security_group_ids}"]
}

module "ec2" {
  source = "./modules/ec2"

  associate_public_ip_address = true
  db_host                     = "${module.rds.db_host}"
  db_name                     = "${var.db_name}"
  db_user                     = "${var.db_user}"
  db_password                 = "${var.db_password}"
  key_name                    = "learn-aws-wp"
  name                        = "${var.project_name}"
  subnet_id                   = "${element(module.vpc.public_subnet_ids, 0)}"
  vpc_security_group_ids      = ["${module.sg.security_group_ids}"]
}
