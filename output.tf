output "instance-public-ip" {
  value = "${aws_instance.eg1.public_ip}"
}

#Output AWS name servers
output "name-servers" {
  value = "${aws_route53_zone.avila-com.name_servers}"
}

output "rds" {
  value = "${aws_db_instance.mariadb.endpoint}"
}
