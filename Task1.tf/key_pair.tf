resource "aws_key_pair" "us-west-2" {
  key_name   = "Terraform Bastion"
  public_key = "${file("~/.ssh/id_rsa.pub")}"
}
