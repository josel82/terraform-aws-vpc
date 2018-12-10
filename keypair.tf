resource "aws_key_pair" "myKeyPair" {
    key_name = "myKeyPair"
    public_key = "${file("./keys/mykey.pub")}"
}
