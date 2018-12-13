# S3 Bucket declaration

resource "aws_s3_bucket" "s3-example" {
  bucket = "bucket-example-trt82"
  acl    = "private"

  tags {
    Name = "bucket-example-trt82"
  }
}
