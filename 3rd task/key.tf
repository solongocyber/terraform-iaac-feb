resource "aws_key_pair" "us-east-1-key" {
  key_name   = "3rdtaskagain-key"
  public_key = "${file("~/.ssh/id_rsa.pub")}"
}