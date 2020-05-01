resource "aws_subnet" "3rdtask_private1" {
  vpc_id     = "${aws_vpc.3rdtask_vpc.id}"
  cidr_block = "${var.private_cidr1}"
  tags = "${var.tags}"
}

resource "aws_subnet" "3rdtask_private2" {
  vpc_id     = "${aws_vpc.3rdtask_vpc.id}"
  cidr_block = "${var.private_cidr2}"
  tags = "${var.tags}"
}

resource "aws_subnet" "3rdtask_private3" {
  vpc_id     = "${aws_vpc.3rdtask_vpc.id}"
  cidr_block = "${var.private_cidr3}"
  tags = "${var.tags}"
  
}
