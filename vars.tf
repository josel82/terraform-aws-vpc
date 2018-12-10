variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}

variable "AWS_REGION" {
  default = "eu-west-1"
}

variable "AWS_AVAILABILITY_ZONES" {
  type = "map"

  default = {
    zone-1 = "eu-west-1a"
    zone-2 = "eu-west-1b"
    zone-3 = "eu-west-1c"
  }
}

variable "AMIS" {
  type = "map"

  default = {
    eu-west-1 = "ami-09f0b8b3e41191524"
    us-east-1 = "ami-0f9cf087c1f27d9b1"
    us-est-2  = "ami-076e276d85f524150"
  }
}

variable "PUBLIC_IP" {}
