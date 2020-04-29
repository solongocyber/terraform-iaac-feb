resource "aws_key_pair" "us-east-1" {
  key_name   = "Terraform task2"
  public_key = "${file("~/.ssh/id_rsa.pub")}"
}


