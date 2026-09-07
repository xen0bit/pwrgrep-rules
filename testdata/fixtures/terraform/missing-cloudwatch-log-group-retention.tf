# Fixture for missing-cloudwatch-log-group-retention.
# ruleid: missing-cloudwatch-log-group-retention
resource "aws_cloudwatch_log_group" "bad1" {
  name = "bad1"
}
# ruleid: missing-cloudwatch-log-group-retention
resource "aws_cloudwatch_log_group" "bad2" {
  name = "bad2"
}
# ok: missing-cloudwatch-log-group-retention
resource "aws_s3_bucket" "good1" {
  bucket = "good1"
}
# ok: missing-cloudwatch-log-group-retention
resource "aws_s3_bucket" "good2" {
  bucket = "good2"
}
