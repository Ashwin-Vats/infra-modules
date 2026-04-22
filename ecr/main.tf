#########################################
# ECR Repository
#########################################

resource "aws_ecr_repository" "app" {

  name = "${var.env}-${var.repository_name}"

  image_scanning_configuration {
    scan_on_push = true
  }

  image_tag_mutability = "MUTABLE"

  tags = {
    Name        = "${var.env}-${var.repository_name}"
    Environment = var.env
  }
}

#########################################
# Lifecycle Policy
#########################################

resource "aws_ecr_lifecycle_policy" "app" {

  repository = aws_ecr_repository.app.name

  policy = jsonencode({

    rules = [

      {
        rulePriority = 1

        description = "Expire old images"

        selection = {
          tagStatus   = "any"
          countType   = "imageCountMoreThan"
          countNumber = 20
        }

        action = {
          type = "expire"
        }
      }

    ]
  })
}