# Fixture for missing-autoscaling-group-tags.
# ruleid: missing-autoscaling-group-tags
resource "aws_autoscaling_group" "bad1" {
  name = "bad1"
}
# ruleid: missing-autoscaling-group-tags
resource "aws_autoscaling_group" "bad2" {
  name = "bad2"
}
# ok: missing-autoscaling-group-tags
resource "aws_s3_bucket" "good1" {
  bucket = "good1"
}
# ok: missing-autoscaling-group-tags
resource "aws_s3_bucket" "good2" {
  bucket = "good2"
}
