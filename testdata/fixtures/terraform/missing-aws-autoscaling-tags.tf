# Fixture for missing-aws-autoscaling-tags.
# Ok blocks come first: the tag/tags exclusions span forward otherwise.
# ok: missing-aws-autoscaling-tags
resource "aws_autoscaling_group" "good1" {
  name = "good1"
  tag {
    key = "env"
    value = "prod"
    propagate_at_launch = true
  }
}
# ok: missing-aws-autoscaling-tags
resource "aws_autoscaling_group" "good2" {
  name = "good2"
  tags = concat([], [])
}
# ruleid: missing-aws-autoscaling-tags
resource "aws_autoscaling_group" "bad1" {
  name = "bad1"
}
# ruleid: missing-aws-autoscaling-tags
resource "aws_autoscaling_group" "bad2" {
  name = "bad2"
}
