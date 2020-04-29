# This is from Terraform website

# resource "aws_key_pair" "deployer" {      *aws_key_pair= What provider and what type of reasource you are creating    *deployer= can be anyname. it's naming just locally
#   key_name   = "deployer-key"              * deployer-key= This name will appear in your region
#   public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD3F6tyPEFEzV0LX3X8BsXdMsQz1x2cEikKDEY0aIj41qgxMCP/iteneqXSIFZBp5vizPvaoIR3Um9xK7PGoW8giupGn+EPuxIA4cDM4vzOqOkiMPhz5XK0whEjkVzTo4+S0puvDZuwIsdiW9mxhJc7tgBNL0cYlWSYVkz4G/fslNfRPW5mYAM49f4fhtxPb5ok4Q2Lg9dPKVHO/Bgeu5woMc7RY0p1ej6D4CKFE6lymSDJpW0YHX/wqE9+cfEauh7xZcG0q9t2ta6F6fmX0agvpFyZo8aFbXeUBr7osSCJNgvavWbM/06niWrOvYX2xwWdhXmXSrbX8ZbabVohBK41 email@example.com"
# }                                          * Instead of full public key , we can givin location of key.


#  Change it like this: 

resource "aws_key_pair" "solongokey" {         
  key_name   = "Terraform homework2"
  public_key = "${file("~/.ssh/id_rsa.pub")}"
}





//Don't change anything in  this file

//It's just template
