#########################################
# Node Assume Role Policy
#########################################

data "aws_iam_policy_document" "node_assume_role" {

  statement {

    actions = ["sts:AssumeRole"]

    principals {

      type = "Service"

      identifiers = [
        "ec2.amazonaws.com"
      ]
    }
  }
}

#########################################
# Node IAM Role
#########################################

resource "aws_iam_role" "node" {

  name = "${var.env}-node-role"

  assume_role_policy = data.aws_iam_policy_document.node_assume_role.json
}

#########################################
# Attach Required Policies
#########################################

resource "aws_iam_role_policy_attachment" "worker_node" {

  role = aws_iam_role.node.name

  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
}

resource "aws_iam_role_policy_attachment" "cni" {

  role = aws_iam_role.node.name

  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
}

resource "aws_iam_role_policy_attachment" "ecr_read" {

  role = aws_iam_role.node.name

  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}

#########################################
# Instance Profile
#########################################

resource "aws_iam_instance_profile" "node" {

  name = "${var.env}-node-profile"

  role = aws_iam_role.node.name
}