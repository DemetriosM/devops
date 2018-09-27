# VPC
resource "aws_vpc" "vpc" {
    cidr_block                          = "${cidrsubnet(var.vpc_cidr, 0, 0)}"
    instance_tenancy                    = "${var.instance_tenancy}"
    enable_dns_support                  = "${var.enable_dns_support}"
    enable_dns_hostnames                = "${var.enable_dns_hostnames}"
    assign_generated_ipv6_cidr_block    = "${var.assign_generated_ipv6_cidr_block}"
    enable_classiclink                  = "${var.enable_classiclink}"
    tags {
        Name            = "${lower(var.name)}-vpc-${lower(var.environment)}"
        Environment     = "${var.environment}"
        Orchestration   = "${var.orchestration}"
        Createdby       = "${var.createdby}"
    }
}

# Security group
resource "aws_security_group" "sg" {
    name                = "${var.name}-sg-${var.environment}"
    description         = "Security Group ${var.name}-sg-${var.environment}"
    vpc_id              = "${aws_vpc.vpc.id}"

    tags {
        Name            = "${var.name}-sg-${var.environment}"
        Environment     = "${var.environment}"
        Orchestration   = "${var.orchestration}"
        Createdby       = "${var.createdby}"
    }
    lifecycle {
        create_before_destroy = true
    }
    # allow traffic for TCP 22 to host
    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    # allow traffic for TCP 22 from host
    egress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    depends_on = ["aws_vpc.vpc"]
}

# Add security group rules (one more way)
resource "aws_security_group_rule" "ingress_ports" {
    count               = "${length(var.allowed_ports)}"
    type                = "ingress"
    security_group_id   = "${aws_security_group.sg.id}"
    from_port           = "${element(var.allowed_ports, count.index)}"
    to_port             = "${element(var.allowed_ports, count.index)}"
    protocol            = "tcp"
    cidr_blocks         = ["0.0.0.0/0"]
    depends_on          = ["aws_security_group.sg"]
}
resource "aws_security_group_rule" "egress_ports" {
    count               = "${var.enable_all_egress_ports ? 0 : length(var.allowed_ports)}"
    type                = "egress"
    security_group_id   = "${aws_security_group.sg.id}"
    from_port           = "${element(var.allowed_ports, count.index)}"
    to_port             = "${element(var.allowed_ports, count.index)}"
    protocol            = "tcp"
    cidr_blocks         = ["0.0.0.0/0"]
    depends_on          = ["aws_security_group.sg"]
}
