output "vpc" {
    value = "${aws_vpc.3rdtask_vpc.id}"
}

output "public_subnets" {
value = [
 "${aws_subnet.public1.id}",         
 "${aws_subnet.public2.id}",         
 "${aws_subnet.public3.id}"          
]
}

output "private_subnets" {
value = [
 "${aws_subnet.3rdtask_private1.id}",                        
 "${aws_subnet.3rdtask_private2.id}",                         
 "${aws_subnet.3rdtask_private3.id}"                         
]
}

output "tags" {
value = "${var.tags}"
}

output "internet_gateway" {
value = "${aws_internet_gateway.gw.id}"
}

output "nat_gateway" {
value = "${aws_nat_gateway.gw.id}"
}


output "route_table"{
    value = "${aws_route_table.route_table.id}"
}

output "route_table_association" {
    value = "${aws_route_table_association.3rdtask_public1.id}"
}