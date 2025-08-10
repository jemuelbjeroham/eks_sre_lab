terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 1.0"
    }
  }
}

provider "aws" {
  region = var.region
}

resource "aws_s3_bucket" "tfstate_bucket" {
  bucket = var.bucket_name
  acl    = "private"

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  lifecycle_rule {
    id                                     = "tfstate-cleanup"
    enabled                                = true
    abort_incomplete_multipart_upload_days = 7
  }

  tags = {
    Name        = "terraform-state-${var.bucket_name}"
    Environment = var.environment
  }
}

resource "aws_s3_bucket_public_access_block" "block" {
  bucket                  = aws_s3_bucket.tfstate_bucket.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true

}

resource "aws_dynamodb_table" "tfstate_lock" {
  name         = var.dynamodb_table
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name = var.dynamodb_table
  }
}

output "s3_bucket" {
  value = aws_s3_bucket.tfstate_bucket.bucket

}

output "dynamodb_table" {
  value = aws_dynamodb_table.tfstate_lock.name
}