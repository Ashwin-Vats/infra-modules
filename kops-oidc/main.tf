resource "aws_iam_openid_connect_provider" "kops" {
  url = "https://oidc.${var.cluster_name}"

  client_id_list = [
    "sts.amazonaws.com"
  ]

  thumbprint_list = [
    "9e99a48a9960b14926bb7f3b02e22da0afd10e3f"
  ]

  tags = {
    Name        = "${var.env}-oidc"
    Environment = var.env
  }
}