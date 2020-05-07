resource "aws_vpc" "my-vpc" {
  cidr_block = "${var.vpc_cidr}"
  tags        = "${var.tags}"
}

# Public Subnets
resource "aws_subnet" "public1" {
    vpc_id     = "${aws_vpc.my-vpc.id}"
    cidr_block = "${var.public1_cidr}"
    map_public_ip_on_launch =   "true"
    availability_zone   =   "${var.region}${var.az1}"
    tags        = "${var.tags}"
}
resource "aws_subnet" "public2" {
    vpc_id     = "${aws_vpc.my-vpc.id}"
    cidr_block = "${var.public2_cidr}"
    map_public_ip_on_launch =   "true"
    availability_zone   =   "${var.region}${var.az2}"
    tags        = "${var.tags}"
}
resource "aws_subnet" "public3" {
    vpc_id     = "${aws_vpc.my-vpc.id}"
    cidr_block = "${var.public3_cidr}"
    map_public_ip_on_launch =   "true"
    availability_zone   =   "${var.region}${var.az3}"
    tags        = "${var.tags}"
}


# Internet Gateway
resource "aws_internet_gateway" "my-ig" {
  vpc_id = "${aws_vpc.my-vpc.id}"
  tags        = "${var.tags}"
}

# Public Route Table
resource "aws_route_table" "my-rt" {
  vpc_id = "${aws_vpc.my-vpc.id}"
  tags        = "${var.tags}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.my-ig.id}"
  }
}

# Public Route Table Association
resource "aws_route_table_association" "b1" {
  subnet_id      = "${aws_subnet.public1.id}"
  route_table_id = "${aws_route_table.my-rt.id}"
}
resource "aws_route_table_association" "b2" {
  subnet_id      = "${aws_subnet.public2.id}"
  route_table_id = "${aws_route_table.my-rt.id}"
}
resource "aws_route_table_association" "b3" {
  subnet_id      = "${aws_subnet.public3.id}"
  route_table_id = "${aws_route_table.my-rt.id}"
}


# Private Subnet
resource "aws_subnet" "private1" {
    vpc_id     = "${aws_vpc.my-vpc.id}"
    cidr_block = "${var.private1_cidr}"
    map_public_ip_on_launch =   "false"
    availability_zone   =   "${var.region}${var.az1}"
    tags        = "${var.tags}"
}
resource "aws_subnet" "private2" {
    vpc_id     = "${aws_vpc.my-vpc.id}"
    cidr_block = "${var.private2_cidr}"
    map_public_ip_on_launch =   "false"
    availability_zone   =   "${var.region}${var.az2}"
    tags        = "${var.tags}"
}
resource "aws_subnet" "private3" {
    vpc_id     = "${aws_vpc.my-vpc.id}"
    cidr_block = "${var.private3_cidr}"
    map_public_ip_on_launch =   "false"
    availability_zone   =   "${var.region}${var.az3}"
    tags        = "${var.tags}"
}

# Elastic IP
    resource "aws_eip" "my-eip" {
    vpc     =       true
    tags    =       "${var.tags}"
}


# Nat Gateway
resource "aws_nat_gateway" "my-ng" {
  allocation_id = "${aws_eip.my-eip.id}"
  tags        = "${var.tags}"
  subnet_id     = "${aws_subnet.public1.id}"
}


# Private Route Table
resource "aws_route_table" "my-rt2" {
  vpc_id = "${aws_vpc.my-vpc.id}"
  tags        = "${var.tags}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_nat_gateway.my-ng.id}"
  }
}

#  Private Route Table association
resource "aws_route_table_association" "a1" {
  subnet_id      = "${aws_subnet.private1.id}"
  route_table_id = "${aws_route_table.my-rt2.id}"
}
resource "aws_route_table_association" "a2" {
  subnet_id      = "${aws_subnet.private2.id}"
  route_table_id = "${aws_route_table.my-rt2.id}"
}
resource "aws_route_table_association" "a3" {
  subnet_id      = "${aws_subnet.private3.id}"
  route_table_id = "${aws_route_table.my-rt2.id}"
}