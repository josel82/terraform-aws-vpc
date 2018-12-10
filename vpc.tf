#**************** VPC *****************
resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  enable_classiclink   = "false"

  tags {
    Name = "main"
  }
}

#*********** Public subnets ***********
resource "aws_subnet" "main-public-1" {
  vpc_id                  = "${aws_vpc.main.id}"
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "eu-west-1a"

  tags {
    Name = "main-public-1"
  }
}

resource "aws_subnet" "main-public-2" {
  vpc_id                  = "${aws_vpc.main.id}"
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "eu-west-1b"

  tags {
    Name = "main-public-2"
  }
}

resource "aws_subnet" "main-public-3" {
  vpc_id                  = "${aws_vpc.main.id}"
  cidr_block              = "10.0.3.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "eu-west-1c"

  tags {
    Name = "main-public-3"
  }
}

#************ Private subnets *************
resource "aws_subnet" "main-private-1" {
  vpc_id                  = "${aws_vpc.main.id}"
  cidr_block              = "10.0.4.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "eu-west-1a"

  tags {
    Name = "main-private-1"
  }
}

resource "aws_subnet" "main-private-2" {
  vpc_id                  = "${aws_vpc.main.id}"
  cidr_block              = "10.0.5.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "eu-west-1b"

  tags {
    Name = "main-private-2"
  }
}

resource "aws_subnet" "main-private-3" {
  vpc_id                  = "${aws_vpc.main.id}"
  cidr_block              = "10.0.6.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "eu-west-1c"

  tags {
    Name = "main-private-3"
  }
}
