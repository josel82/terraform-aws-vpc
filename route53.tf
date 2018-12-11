resource "aws_route53_zone" "avila-com" {
  name = "avila.com"
}

resource "aws_route53_record" "server1-record" {
  zone_id = "${aws_route53_zone.avila-com.zone_id}"
  name    = "server1.avila.com"
  type    = "A"
  ttl     = "300"
  records = ["${aws_instance.eg1.public_ip}"]
}

resource "aws_route53_record" "www-record" {
  zone_id = "${aws_route53_zone.avila-com.zone_id}"
  name    = "www.avila.com"
  type    = "A"
  ttl     = "300"
  records = ["${aws_instance.eg1.public_ip}"]
}

#Output AWS name servers
output "name-servers" {
  value = "${aws_route53_zone.avila-com.name_servers}"
}
