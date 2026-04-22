#########################################
# OIDC Trust Policy
#########################################

data "aws_iam_policy_document" "argocd_assume_role" {

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
        "system:serviceaccount:argocd:*"
      ]
    }
  }
}

#########################################
# ArgoCD Role
#########################################

resource "aws_iam_role" "argocd" {

  name = "${var.env}-argocd"

  assume_role_policy = data.aws_iam_policy_document.argocd_assume_role.json
}

#########################################
# ArgoCD Policy
#########################################

resource "aws_iam_policy" "argocd" {

  name = "${var.env}-argocd-policy"

  policy = jsonencode({

    Version = "2012-10-17"

    Statement = [

      {
        Effect = "Allow"

        Action = [
          "ecr:GetAuthorizationToken",
          "ecr:BatchCheckLayerAvailability",
          "ecr:GetDownloadUrlForLayer",
          "ecr:BatchGetImage"
        ]

        Resource = "*"
      }

    ]
  })
}

#########################################
# Attach Policy
#########################################

resource "aws_iam_role_policy_attachment" "argocd" {

  role = aws_iam_role.argocd.name

  policy_arn = aws_iam_policy.argocd.arn
}