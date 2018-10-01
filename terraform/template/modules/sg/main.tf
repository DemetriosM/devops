resource "aws_security_group" "sg" {
  description = "Security group for ${lower(var.name)}"
  name        = "${lower(var.name)}-sg"
  vpc_id      = "${var.vpc_id}"
}

resource "aws_security_group_rule" "ingress_ports" {
    count               = "${length(var.ports)}"
    type                = "ingress"
    security_group_id   = "${aws_security_group.sg.id}"
    from_port           = "${element(var.ports, count.index)}"
    to_port             = "${element(var.ports, count.index)}"
    protocol            = "tcp"
    cidr_blocks         = ["0.0.0.0/0"]

    depends_on          = ["aws_security_group.sg"]
}
resource "aws_security_group_rule" "egress_ports" {
    count               = "${length(var.ports)}"
    type                = "egress"
    security_group_id   = "${aws_security_group.sg.id}"
    from_port           = "${element(var.ports, count.index)}"
    to_port             = "${element(var.ports, count.index)}"
    protocol            = "tcp"
    cidr_blocks         = ["0.0.0.0/0"]

    depends_on          = ["aws_security_group.sg"]
}