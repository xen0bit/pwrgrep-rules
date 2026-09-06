# CWE-732: S3 bucket ACL public-read second variant using aws_s3_bucket.
# ruleid: aws-s3-public-read
resource "aws_s3_bucket" "bad1" {
  bucket = "bad1-bucket"
  acl    = "public-read"
}
# ruleid: aws-s3-public-read
resource "aws_s3_bucket" "bad2" {
  bucket = "bad2-bucket"
  acl    = "public-read"
}
# ruleid: aws-s3-public-read
resource "aws_s3_bucket" "bad3" {
  bucket = "bad3-bucket"
  acl    = "public-read"
}
# ok: aws-s3-public-read
resource "aws_s3_bucket" "good1" {
  bucket = "good1-bucket"
  acl    = "private"
}
# ok: aws-s3-public-read
resource "aws_s3_bucket" "good2" {
  bucket = "good2-bucket"
  acl    = "private"
}
