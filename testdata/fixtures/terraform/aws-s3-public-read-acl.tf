# CWE-732: S3 bucket ACL public-read.
# ruleid: aws-s3-public-read-acl
resource "aws_s3_bucket_acl" "bad1" {
  bucket = aws_s3_bucket.example.id
  acl    = "public-read"
}
# ruleid: aws-s3-public-read-acl
resource "aws_s3_bucket_acl" "bad2" {
  bucket = "my-bucket"
  acl    = "public-read"
}
# ok: aws-s3-public-read-acl
resource "aws_s3_bucket_acl" "good1" {
  bucket = aws_s3_bucket.example.id
  acl    = "private"
}
# ok: aws-s3-public-read-acl
resource "aws_s3_bucket_acl" "good2" {
  bucket = "my-bucket-2"
  acl    = "private"
}
# ok: aws-s3-public-read-acl
resource "aws_s3_bucket" "ok-bucket" {
  bucket = "ok-bucket"
  acl    = "private"
}
