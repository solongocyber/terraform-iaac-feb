resource "aws_key_pair" "us-east-1" {
  key_name   = "Terraform Bastion"
  public_key = "${file("~/.ssh/id_rsa.pub")}"
}


