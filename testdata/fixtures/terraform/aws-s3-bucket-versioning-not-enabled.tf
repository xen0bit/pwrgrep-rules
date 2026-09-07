# Fixture for aws-s3-bucket-versioning-not-enabled.
# ruleid: aws-s3-bucket-versioning-not-enabled
resource "aws_s3_bucket" "bad1" {
}
# ruleid: aws-s3-bucket-versioning-not-enabled
resource "aws_s3_bucket" "bad2" {
}
# ok: aws-s3-bucket-versioning-not-enabled
resource "aws_s3_bucket" "good1" {
  versioning {
    enabled = true
  }
}
# ok: aws-s3-bucket-versioning-not-enabled
resource "aws_s3_bucket" "good2" {
  versioning {
    enabled = var.example
  }
}
