
// create instance
resource "aws_instance" "homework2" {
  ami           = "ami-0323c3dd2da7fb37d"
  instance_type = "t2.micro"
  tags = {
    Name = "task2"
  }
}

// output of instance // put id because every instance has id
output "instance_id" {
  value = "${aws_instance.homework2.id}"
}



// Create key 
resource "aws_key_pair" "us-east-1-homework2" {
  key_name   = "Terraform homework2"
  public_key = "${file("~/.ssh/id_rsa.pub")}"
}

// output of create key_pair
output "key_name"{
value = "${aws_key_pair.us-east-1-homework2.key_name}"

}
// output of public key

output "actual_key"{
value = "${aws_key_pair.us-east-1-homework2.public_key}"

}



//arn means Amazon own name
output "instance_arn" {
  value = "${aws_instance.homework2.arn}"
}

// output of public ip
output "instance_public_ip" {
  value = "${aws_instance.homework2.public_ip}"

}

// output of route53
output "instance_public_dns" {
  value = "${aws_instance.homework2.public_dns}"

}
// output of availability_zone
output "instance_availability_zone" {
  value = "${aws_instance.homework2.availability_zone}"
}
 
output "my_message" {
value = "Log in to Wordpress reset password"
}
