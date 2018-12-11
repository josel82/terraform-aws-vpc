resource "aws_security_group" "eg1-instance" {
  vpc_id      = "${aws_vpc.main.id}"
  name        = "allow-ssh"
  description = "security group that allows ssh and all outgoing traffic"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${var.PUBLIC_IP}"]
  }

  tags {
    Name = "eg1-instance"
  }
}

resource "aws_security_group" "allow-mariadb" {
  vpc_id      = "${aws_vpc.main.id}"
  name        = "allow-mariadb"
  description = "allow-mariadb"

  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = ["${aws_security_group.eg1-instance.id}"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    self        = true
  }

  tags {
    Name = "allow-mariadb"
  }
}
