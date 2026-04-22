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
      test     = "StringLike"
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

  name = "${var.env}-external-dns"

  assume_role_policy = data.aws_iam_policy_document.irsa_assume_role.json
}

resource "aws_iam_policy" "external_dns" {

  name = "${var.env}-external-dns-policy"

  policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Action = [
          "route53:ChangeResourceRecordSets",
          "route53:ListHostedZones",
          "route53:ListResourceRecordSets"
        ]

        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "external_dns" {

  role = aws_iam_role.external_dns.name

  policy_arn = aws_iam_policy.external_dns.arn
}

#########################################
# cert-manager Role
#########################################

resource "aws_iam_role" "cert_manager" {

  name = "${var.env}-cert-manager"

  assume_role_policy = data.aws_iam_policy_document.irsa_assume_role.json
}

resource "aws_iam_policy" "cert_manager" {

  name = "${var.env}-cert-manager-policy"

  policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Action = [
          "route53:GetChange",
          "route53:ChangeResourceRecordSets",
          "route53:ListHostedZones"
        ]

        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "cert_manager" {

  role = aws_iam_role.cert_manager.name

  policy_arn = aws_iam_policy.cert_manager.arn
}

#########################################
# Cluster Autoscaler Role
#########################################

resource "aws_iam_role" "autoscaler" {

  name = "${var.env}-cluster-autoscaler"

  assume_role_policy = data.aws_iam_policy_document.irsa_assume_role.json
}

resource "aws_iam_role_policy_attachment" "autoscaler" {

  role = aws_iam_role.autoscaler.name

  policy_arn = "arn:aws:iam::aws:policy/AutoScalingFullAccess"
}

#########################################
# ALB Controller Role
#########################################

resource "aws_iam_role" "alb_controller" {

  name = "${var.env}-alb-controller"

  assume_role_policy = data.aws_iam_policy_document.irsa_assume_role.json
}

resource "aws_iam_role_policy_attachment" "alb_controller" {

  role = aws_iam_role.alb_controller.name

  policy_arn = "arn:aws:iam::aws:policy/ElasticLoadBalancingFullAccess"
}