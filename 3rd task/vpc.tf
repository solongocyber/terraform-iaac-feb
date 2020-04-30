resource "aws_vpc" "3rdtask_vpc" {
  cidr_block       = "${var.vpc_cidr}"
  tags = {
    Name = "3rdtask_vpc"
  }
}

resource "aws_subnet" "3rdtask_public1" {
  vpc_id     = "${aws_vpc.3rdtask_vpc.id}"
  cidr_block = "${var.public_cidrs1}"
}

resource "aws_subnet" "3rdtask_public2" {
  vpc_id     = "${aws_vpc.3rdtask_vpc.id}"
  cidr_block = "${var.public_cidrs2}"
}

resource "aws_subnet" "3rdtask_public3" {
  vpc_id     = "${aws_vpc.3rdtask_vpc.id}"
  cidr_block = "${var.public_cidrs3}"
}



