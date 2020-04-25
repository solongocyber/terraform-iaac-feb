
resource "aws_route53_record" "www" {
zone_id = "Z00857591VROTR0SDC0I1"
name = "www.mydevop.com"
type = "A"
ttl = "300"
records = ["${aws_instance.web.public_ip}"]
}

