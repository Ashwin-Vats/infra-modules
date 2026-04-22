#########################################
# OIDC Trust Policy
#########################################

data "aws_iam_policy_document" "irsa_assume_role" {

  statement {

    actions = ["sts:AssumeRoleWithWebIdentity"]

    principals {
      type        = "Federated"
      identifiers = [var.oidc_provider_arn]
    }

    condition {
      test = "StringLike"

      variable = "${replace(var.oidc_provider_url, "https://", "")}:sub"

      values = [
        "system:serviceaccount:*:*"
      ]
    }
  }
}

#########################################
# external-dns Role
#########################################

resource "aws_iam_role" "external_dns" {

  name = "${var.env}-external-dns-irsa"

  assume_role_policy =   data.aws_iam_policy_document.irsa_assume_role.json

  tags = {
    Environment = var.env
  }
}

resource "aws_iam_role_policy_attachment" "external_dns" {

  role =    aws_iam_role.external_dns.name

  policy_arn =   "arn:aws:iam::aws:policy/AmazonRoute53FullAccess"
}

#########################################
# cert-manager Role
#########################################

resource "aws_iam_role" "cert_manager" {

  name = "${var.env}-cert-manager-irsa"

  assume_role_policy =   data.aws_iam_policy_document.irsa_assume_role.json

  tags = {
    Environment = var.env
  }
}

resource "aws_iam_role_policy_attachment" "cert_manager" {

  role =   aws_iam_role.cert_manager.name

  policy_arn =    "arn:aws:iam::aws:policy/AmazonRoute53FullAccess"
}

#########################################
# cluster-autoscaler Role
#########################################

resource "aws_iam_role" "cluster_autoscaler" {

  name = "${var.env}-cluster-autoscaler-irsa"

  assume_role_policy =    data.aws_iam_policy_document.irsa_assume_role.json

  tags = {
    Environment = var.env
  }
}

resource "aws_iam_role_policy_attachment" "cluster_autoscaler" {

  role =    aws_iam_role.cluster_autoscaler.name

  policy_arn =   "arn:aws:iam::aws:policy/AutoScalingFullAccess"
}