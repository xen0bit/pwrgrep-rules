# Fixture for s3-public-read-bucket.
# The finding lands on the acl line, so the annotation sits inside.
resource "aws_s3_bucket" "bad1" {
  bucket = "bad1"
# ruleid: s3-public-read-bucket
  acl = "public-read"
}
resource "aws_s3_bucket" "bad2" {
  bucket = "bad2"
# ruleid: s3-public-read-bucket
  acl = "authenticated-read"
}
# ok: s3-public-read-bucket
resource "aws_s3_bucket" "good1" {
  bucket = "good1"
  acl = "private"
}
# ok: s3-public-read-bucket
resource "aws_s3_bucket" "good2" {
  bucket = "good2"
  acl = "private"
}
