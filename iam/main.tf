resource "aws_iam_user" "kops" {
  name = "kops-${var.env}"

  tags = {
    Environment = var.env
  }
}

resource "aws_iam_user_policy_attachment" "kops_admin" {
  user       = aws_iam_user.kops.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_access_key" "kops" {
  user = aws_iam_user.kops.name
}