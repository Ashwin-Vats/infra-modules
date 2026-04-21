resource "aws_kms_key" "main" {
  description             = "KMS key for ${var.env} environment"
  deletion_window_in_days = 7
  enable_key_rotation     = true

  tags = {
    Environment = var.env
  }
}

resource "aws_kms_alias" "main" {
  name          = "alias/${var.env}-kms-key"
  target_key_id = aws_kms_key.main.key_id
}