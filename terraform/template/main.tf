provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}

module "vpc" {
  source = "./modules/vpc"

  assign_generated_ipv6_cidr_block = "${var.assign_generated_ipv6_cidr_block}"
  enable_classiclink               = "${var.enable_classiclink}"
  enable_dns_hostnames             = "${var.enable_dns_hostnames}"
  enable_dns_support               = "${var.enable_dns_support}"
  instance_tenancy                 = "${var.instance_tenancy}"
  name                             = "${var.project_name}"
  vpc_cidr                         = "${var.vpc_cidr}"
  vpc_zones                        = "${var.vpc_zones}"
}

module "sg" {
  source = "./modules/sg"
  
  name    = "${var.project_name}"
  ports   = ["${var.ports}"]
  vpc_id  = "${module.vpc.vpc_id}"
}

module "rds" {
  source = "./modules/rds"

  allocated_storage       = "${var.allocated_storage}"
  backup_retention_period = "${var.backup_retention_period}"
  db_name                 = "${var.db_name}"
  db_user                 = "${var.db_user}"
  db_password             = "${var.db_password}"
  engine                  = "${var.engine}"
  engine_version          = "${var.engine_version}"
  instance_class          = "${var.instance_class}"
  name                    = "${var.project_name}"
  private_subnet_ids      = ["${module.vpc.private_subnet_ids}"]
  skip_final_snapshot     = "${var.skip_final_snapshot}"
  vpc_security_group_ids  = ["${module.sg.security_group_ids}"]
}

module "ec2" {
  source = "./modules/ec2"

  ami                         = "${var.ami}"
  associate_public_ip_address = "${var.associate_public_ip_address}"
  db_host                     = "${module.rds.db_host}"
  db_name                     = "${var.db_name}"
  db_user                     = "${var.db_user}"
  db_password                 = "${var.db_password}"
  instance_type               = "${var.instance_type}"
  key_name                    = "${var.key_name}"
  name                        = "${var.project_name}"
  subnet_id                   = "${element(module.vpc.public_subnet_ids, 0)}"
  vpc_security_group_ids      = ["${module.sg.security_group_ids}"]
}
