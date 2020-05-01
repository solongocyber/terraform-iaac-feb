resource "aws_subnet" "public1" {
  vpc_id     = "${aws_vpc.3rdtask_vpc.id}"
  cidr_block = "${var.public_cidr1}"
  tags = "${var.tags}"
  availability_zone = "${var.region}${var.az1}"
  map_public_ip_on_launch = "true"
}

resource "aws_subnet" "public2" {
  vpc_id     = "${aws_vpc.3rdtask_vpc.id}"
  cidr_block = "${var.public_cidr2}"
  tags = "${var.tags}"
   map_public_ip_on_launch = "true"
    availability_zone = "${var.region}${var.az2}"
}

resource "aws_subnet" "public3" {
  vpc_id     = "${aws_vpc.3rdtask_vpc.id}"
  cidr_block = "${var.public_cidr3}"
  tags = "${var.tags}"
   map_public_ip_on_launch = "true"
    availability_zone = "${var.region}${var.az3}"

}
