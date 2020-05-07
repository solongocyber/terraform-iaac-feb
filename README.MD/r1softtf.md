
### r1soft.tf


    provider "aws" {
    region  = "${var.region}"
    version = "2.59"
     }


      
      
      



data "aws_ami" "centos" {
    most_recent = true
   owners      = ["679593333241"]
   
   > filter {
    name   = "state"
    values = ["available"]
    }

    filter {
    name   = "name"
    values = ["CentOS Linux 7 x86_64 HVM EBS *"]
    }
    }

    resource "aws_key_pair" "my-key" {
    key_name   = "my-bastion"
    public_key = "${file("~/.ssh/id_rsa.pub")}"
    }

    resource "aws_instance" "centos" {
    ami           = "${data.aws_ami.centos.id}"
    instance_type = "${var.instance_type}"
    key_name      = "${aws_key_pair.my-key.key_name}"
    subnet_id     = "${aws_subnet.public1.id}"
    security_groups = [
    "${aws_security_group.my-sg.id}"
     ]
    }

    resource "aws_security_group" "my-sg" {
    name        = "rash-sg"
    vpc_id = "${aws_vpc.my-vpc.id}"
    tags          =     "${var.tags}"
    ingress {
    description = "https"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "http"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
    description = "ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "r1soft"
    from_port   = 2049
    to_port     = 2049
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}