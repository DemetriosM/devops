output "db_host" {
  description = "DB address"
  value = "${aws_db_instance.rds.address}"
}
output "db_name" {
  description = "DB name"
  value = "${var.db_name}"
}
output "db_user" {
  description = "DB user name"
  value = "${var.db_user}"
}
output "db_password" {
  description = "DB password"
  value = "${var.db_password}"
}
