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
