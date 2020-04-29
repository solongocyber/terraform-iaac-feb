


// How to create instance.tf file


# resource "aws_instance" "solongoweb" {          *"aws_instance"= It tells what type of resource*, *"solongoweb"= Resource name can be anyname but not same as other sources*
#  ami           = "${data.aws_ami.ubuntu.id}"     *This can find ir from main page lunching instances*
#   instance_type = "t2.micro"
#   tags = {
# Name = "HelloWorld"      *Name=Instance name*
#   }
# } - This template is from https://www.terraform.io/docs/providers/aws/r/instance.html



  resource "aws_instance" "solongoweb" {
  ami           = "ami-0323c3dd2da7fb37d"
  instance_type = "t2.micro"
  key_name = "${aws_key_pair.solongokey.key_name}"
  security_group = "${aws_security_group.solongoweb_sec.name}"


} 
# //////// Order to attach key name to instance i need to make Interpolution using key_name i created in tf file:

# resource "aws_key_pair" "solongokey" {         
#   key_name   = "Terraform homework2"
#   public_key = "${file("~/.ssh/id_rsa.pub")}"
# }

# //////// Interpolution will be:

  # ======key_name = "${aws_key_pair.solongokey.key_name}"====== 
  # "aws_key_pair = resource type
  # solongokey = resource local name
  # key_name = parameters of value 

#  order to add security group to instance i need to make interpolition using security group i created in tf file:
# resource "aws_security_group" "solongoweb_sec" {
#   name        = "solongoweb_sec"
#   description = "solongoweb_sec"
# }

# Interpolution will be:

#  ======security_group = "${aws_security_group.solongoweb_sec.name}"======
# "aws_security_group" = resource type
# "solongoweb_sec" = resource local name
#  name = parameters of value

//Don't change anything in  this file

//It's just template
