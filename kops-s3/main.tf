resource "aws_s3_bucket" "kops_state" {
  bucket = "${var.env}-kops-state-${var.account_id}"

  tags = {
    Name        = "${var.env}-kops-state"
    Environment = var.env
  }
}

resource "aws_s3_bucket_versioning" "kops_versioning" {
  bucket = aws_s3_bucket.kops_state.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "kops_encryption" {
  bucket = aws_s3_bucket.kops_state.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = var.kms_key_arn
      sse_algorithm     = "aws:kms"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "kops_block" {
  bucket = aws_s3_bucket.kops_state.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}