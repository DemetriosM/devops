# VPC
resource "aws_vpc" "vpc" {
  cidr_block                          = "${var.vpc_cidr}"
  instance_tenancy                    = "${var.instance_tenancy}"
  enable_dns_support                  = "${var.enable_dns_support}"
  enable_dns_hostnames                = "${var.enable_dns_hostnames}"
  assign_generated_ipv6_cidr_block    = "${var.assign_generated_ipv6_cidr_block}"
  tags {
      Name = "${lower(var.name)}-vpc"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "vpc_igw" {
  vpc_id = "${aws_vpc.vpc.id}"
  tags {
    Name = "igw-${lower(var.name)}-vpc"
  }

  depends_on = ["aws_vpc.vpc"]
}

# VPC Subnets
resource "aws_subnet" "public" {
  map_public_ip_on_launch = "true"
  vpc_id                  = "${aws_vpc.vpc.id}"
  count                   = "${length(var.vpc_zones)}"
  cidr_block              = "${cidrsubnet(var.vpc_cidr, 4, count.index * 2)}"
  availability_zone       = "${element(var.vpc_zones, count.index)}"
  tags {
    Name = "public-${lower(var.name)}-${element(var.vpc_zones, count.index)}"
  }

  depends_on = ["aws_vpc.vpc"]
}

resource "aws_subnet" "private" {
  map_public_ip_on_launch = "false"
  vpc_id                  = "${aws_vpc.vpc.id}"
  count                   = "${length(var.vpc_zones)}"
  cidr_block              = "${cidrsubnet(var.vpc_cidr, 4, count.index * 2 + 1)}"
  availability_zone       = "${element(var.vpc_zones, count.index)}"
  tags {
    Name = "private-${lower(var.name)}-${element(var.vpc_zones, count.index)}"
  }

  depends_on = ["aws_vpc.vpc"]
}

#Route table for public subnets
resource "aws_route_table" "public_rt" {
  vpc_id = "${aws_vpc.vpc.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.vpc_igw.id}"
  }
  tags {
    Name = "rt-${lower(var.name)}-public"
  }

  depends_on = ["aws_internet_gateway.vpc_igw"]
}

resource "aws_route_table_association" "public_rt_association" {
  count          = "${length(var.vpc_zones)}"
  route_table_id = "${aws_route_table.public_rt.id}"
  subnet_id      = "${element(aws_subnet.public.*.id, count.index )}"

  depends_on = ["aws_route_table.public_rt"]
}