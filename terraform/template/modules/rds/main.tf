resource "aws_db_instance" "rds" {
  allocated_storage       = "${var.allocated_storage}"
  engine                  = "${var.engine}"
  engine_version          = "${var.engine_version}"
  instance_class          = "${var.instance_class}"
  backup_retention_period = "${var.backup_retention_period}"
  name                    = "${var.db_name}"
  username                = "${var.db_user}"
  password                = "${var.db_password}"
  vpc_security_group_ids  = "${var.vpc_security_group_ids}"
  db_subnet_group_name    = "${var.db_subnet_group_name}"
  skip_final_snapshot     = true
}
