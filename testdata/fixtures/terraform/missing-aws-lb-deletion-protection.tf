# Fixture for missing-aws-lb-deletion-protection.
# ruleid: missing-aws-lb-deletion-protection
resource "aws_alb" "bad1" {
  name = "bad1"
}
# ruleid: missing-aws-lb-deletion-protection
resource "aws_lb" "bad2" {
  name = "bad2"
}
# ok: missing-aws-lb-deletion-protection
resource "aws_alb" "good1" {
  enable_deletion_protection = true
}
# ok: missing-aws-lb-deletion-protection
resource "aws_lb" "good2" {
  enable_deletion_protection = true
}
