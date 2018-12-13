#**************************** GROUP ****************************
resource "aws_iam_group" "admin" {
  name = "admin"
}

resource "aws_iam_group_policy_attachment" "amin-attach" {
  name       = "admin-attach"
  groups     = ["${aws_iam_group.admin.name}"]
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

#**************************** USERS ****************************
resource "aws_iam_user" "admin-1" {
  name = "admin-1"
}

resource "aws_iam_user" "admin-2" {
  name = "admin-2"
}

resource "aws_iam_group_membership" "administrators" {
  name = "administrators"

  users = [
    "${aws_iam_user.admin-1.name}",
    "${aws_iam_user.admin-2.name}",
  ]

  group = "${aws_iam_group.administrators.name}"
}

#**************************** ROLES ****************************
resource "aws_iam_role" "s3-bucket-example-role" {
  name = "s3-bucket-example-role"

  assume_role_policy = <<EOF
  {
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "sts:AssumeRole",
            "Principal": {
              "Service": "ec2.amazonaws.com"
            },
            "Sid":""
        }
    ]
  }
  EOF
}

resource "aws_iam_instance_profile" "s3-bucket-example-role-instance-profile" {
  name  = "s3-bucket-example-role"
  roles = ["${aws_iam_role.s3-bucket-example-role.name}"]
}

#**************************** POLICIES ****************************

resource "aws_iam_role_policy" "s3-bucket-example-role-policy" {
  name = "s3-bucket-example-role-policy"
  role = "${aws_iam_role.s3-bucket-example-role.id}"

  policy = <<EOF
  {
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
              "s3:*"
            ],
            "Resource": [
              "ars:aws:s3:::bucket-example-trt82",
              "ars:aws:s3:::bucket-example-trt82/*"
            ]
        }
    ]
  }
  EOF
}
