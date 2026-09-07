# Fixture for aws-s3-object-lock-not-enabled.
# ruleid: aws-s3-object-lock-not-enabled
resource "aws_s3_bucket" "bad1" {
  object_lock_configuration = {
    object_lock_enabled = "Disabled"
  }
}
# ruleid: aws-s3-object-lock-not-enabled
resource "aws_s3_bucket" "bad2" {
  object_lock_configuration {
    object_lock_enabled = "Disabled"
  }
}
# ok: aws-s3-object-lock-not-enabled
resource "aws_s3_bucket" "good1" {
  object_lock_configuration = {
    object_lock_enabled = "Enabled"
  }
}
# ok: aws-s3-object-lock-not-enabled
resource "aws_s3_bucket" "good2" {
  name = "good2"
}
