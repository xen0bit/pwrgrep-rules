# CWE-778: Log group without retention — logs retained indefinitely.
# A missing retention_in_days lets the group grow forever and hides
# operational cost and audit window. The rule flags groups that omit
# retention_in_days; fix by setting it to a finite value (e.g., 30).
# ruleid: aws-cloudwatch-log-group-no-retention
resource "aws_cloudwatch_log_group" "bad1" {
  name = "bad1"
}
# ruleid: aws-cloudwatch-log-group-no-retention
resource "aws_cloudwatch_log_group" "bad2" {
  name = "bad2"
}
# ok: aws-cloudwatch-log-group-no-retention
resource "aws_cloudwatch_log_group" "good1" {
  name              = "good1"
  retention_in_days = 7
}
# ok: aws-cloudwatch-log-group-no-retention
resource "aws_cloudwatch_log_group" "good2" {
  name              = "good2"
  retention_in_days = 30
}

# ok: aws-cloudwatch-log-group-no-retention
resource "aws_cloudwatch_log_group" "ok3" {
  name              = "ok3"
  retention_in_days = 14
}
