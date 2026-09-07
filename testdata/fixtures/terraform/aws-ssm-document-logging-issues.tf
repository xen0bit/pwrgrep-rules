# Fixture for aws-ssm-document-logging-issues.
resource "aws_ssm_document" "bad1" {
# ruleid: aws-ssm-document-logging-issues
  content = "example-val"
}
resource "aws_ssm_document" "bad2" {
# ruleid: aws-ssm-document-logging-issues
  content = "example-val"
}
# ok: aws-ssm-document-logging-issues
resource "aws_ssm_document" "good1" {
  name = "good1"
}
# ok: aws-ssm-document-logging-issues
resource "aws_ssm_document" "good2" {
  name = "good2"
}
