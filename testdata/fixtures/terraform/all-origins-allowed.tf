# Fixture for all-origins-allowed.
resource "aws_s3_bucket" "bad1" {
  bucket = "bad1"
  cors_rule {
# ruleid: all-origins-allowed
    allowed_origins = ["*"]
  }
}
resource "aws_s3_bucket" "bad2" {
  bucket = "bad2"
  cors_rule {
# ruleid: all-origins-allowed
    allowed_origins = ["*"]
  }
}
# ok: all-origins-allowed
resource "aws_s3_bucket" "good1" {
  bucket = "good1"
  cors_rule {
    allowed_origins = ["https://example.com"]
  }
}
# ok: all-origins-allowed
resource "aws_s3_bucket" "good2" {
  bucket = "good2"
}
