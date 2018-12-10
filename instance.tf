#Instance resource
resource "aws_instance" "eg1" {
  ami           = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "t2.micro"

  #VPC Subnet
  subnet_id = "${aws_subnet.main-public-1.id}"

  #Security group
  vpc_security_group_ids = ["${aws_security_group.allow-ssh.id}"]

  #Public SSH key
  key_name = "${aws_key_pair.myKeyPair.key_name}"
}

#Volume resourse
resource "aws_ebs_volume" "ebs-volume-1" {
  availability_zone = "${lookup(var.AWS_AVAILABILITY_ZONES, "zone-1")}"
  size              = 20
  type              = "gp2"

  tags {
    Name = "ebs-volume-1"
  }
}

#Volume attachement
resource "aws_volume_attachment" "ebs-volume-1-attachment" {
  device_name = "/dev/xvdh"
  volume_id   = "${aws_ebs_volume.ebs-volume-1.id}"
  instance_id = "${aws_instance.eg1.id}"
}
