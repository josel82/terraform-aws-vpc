variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}

variable "AWS_REGION" {
  default = "eu-west-1"
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

