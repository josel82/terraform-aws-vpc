resource "aws_instance" "eg1" {
    ami = "${lookup(var.AMIS, var.AWS_REGION)}"
    instance_type = "t2.micro"

    #VPC Subnet
    subnet_id = "${aws_subnet.main-public-1.id}"

    #Security group
    vpc_security_group_ids = ["${aws_security_group.allow-ssh.id}"]

    #Public SSH key
    key_name = "${aws_key_pair.myKeyPair.key_name}"
}