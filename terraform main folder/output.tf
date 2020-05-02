
# resource "aws_instance" "solongoweb" {
#   ami           = "ami-0323c3dd2da7fb37d"
#   instance_type = "t2.micro"
#  count =3
#   key_name = "${aws_key_pair.solongokey.key_name}"
#   }


# value = 
# aws_instance = type of resource
# solongoweb = name of resource
#  id = run terraform show, it will show all component. take it from there 
#  if creating more than 1 instance and need to see output of all 3 instance it will be added * after local name 
#  records = "${aws_instance.solongoweb.*.public_ip}"


// output of instance // put id because every instance has id
output "instance_id" {
  value = "${aws_instance.solongoweb.id}"
}
//arn means Amazon own name
output "instance_arn" {
  value = "${aws_instance.solongoweb.arn}"
}

// output of public ip
output "instance_public_ip" {
  value = "${aws_instance.solongoweb.public_ip}"

}

// output of route53
output "instance_public_dns" {
  value = "${aws_instance.solongoweb.public_dns}"

}
// output of availability_zone
output "instance_availability_zone" {
  value = "${aws_instance.solongoweb.availability_zone}"
}
 
output "my_message" {
value = "Log in to Wordpress reset password"
}





output "key_name"{
value = "${aws_key_pair.solongokey.key_name}"

}
// output of public key

output "actual_key"{
value = "${aws_key_pair.solongokey.public_key}"

}

output "name" {
  value = "solongo"
}



//Don't change anything in  this file

//It's just template
