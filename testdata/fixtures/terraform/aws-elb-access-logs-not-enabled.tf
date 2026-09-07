# Fixture for aws-elb-access-logs-not-enabled.
# ruleid: aws-elb-access-logs-not-enabled
resource "aws_lb" "bad1" {
}
# ruleid: aws-elb-access-logs-not-enabled
resource "aws_alb" "bad2" {
}
# ok: aws-elb-access-logs-not-enabled
resource "aws_lb" "good1" {
  access_logs {
    enabled = true
  }
}
# ok: aws-elb-access-logs-not-enabled
resource "aws_alb" "good2" {
  subnet_mapping {
  }
}
