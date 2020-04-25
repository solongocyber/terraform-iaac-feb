resource "aws_instance" "web" {
  ami           = "ami-0d6621c01e8c2de2c"
  instance_type = "t2.large"
  user_data = "${file("/home/ec2-user/terraform-iaac-feb/Task1.tf/httpd")}"
  availability_zone = "${data.aws_availability_zones.available.names[0]}"
  key_name = "${aws_key_pair.us-west-2.key_name}"
  security_groups = ["${aws_security_group.allow_http_https.name}","${aws_security_group.allow_ssh.name}"]
  tags = {
    Name = "Terraform-Task-1"
  }
} 

