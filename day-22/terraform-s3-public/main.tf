provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "nautilus_bucket" {
  bucket = "nautilus-s3-11414"

  tags = {
    Name        = "nautilus-s3-11414"
    Environment = "DevOps-Migration"
  }
}

resource "aws_s3_bucket_acl" "nautilus_bucket_acl" {
  bucket = aws_s3_bucket.nautilus_bucket.id
  acl    = "public-read"
}

resource "aws_s3_bucket_public_access_block" "nautilus_bucket_block" {
  bucket                  = aws_s3_bucket.nautilus_bucket.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

