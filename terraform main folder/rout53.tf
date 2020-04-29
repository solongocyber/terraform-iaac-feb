

# resource "aws_route53_record" "www" {          * This template from from Ter website. "wwww"- It can be anyname
# zone_id = ""${aws_route53_zone.primary.zone_id}    *"Zone_id" -It needs to take from aws route53 page manually
# name = "www.example.com"                       * Terraform manage only subdomain, not chase.com, only subdomain like www.chase.com, backup.chase.com
# type = "A"
# ttl = "300"                                     * ttl- time to leave= how fast to web up and running time
# records = ["${aws_eip.lb.public_ip}"]           * This part i take type of source and source name from instance add public_ip.tf file, it means go to resource "aws_instance" resource name is "solongoweb" get publicip address from that source.
# }   I can get ip address from instance but it's manuall work.


# resource "aws_instance" "solongoweb" {          *This instance part is use only makeing Interpolution for record section.
#   ami           = "ami-0323c3dd2da7fb37d"
#   instance_type = "t2.micro"
#   tags = {
#     Name = "Solongoweb"
#   }
# } 

#  If i want more than 1 ip address attach to my domain Creat more instance and attach the ip address to the domain. 
#  If i need to create more than 1 instance and route 53 record recors section can be:

#  records = []"${aws_instance.solongoweb.*.public_ip}"]

#  add that in the record section. 

resource "aws_route53_record" "www" {
zone_id = "Z00857591VROTR0SDC0I1"
name = "www.mydevop.com"
type = "A"
ttl = "300"
records = ["${aws_instance.solongoweb.public_ip}"]
}

#  If


//Don't change anything in  this file

//It's just template
