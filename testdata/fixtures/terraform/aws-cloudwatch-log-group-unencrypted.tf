# CWE-311: CloudWatch log group without CMK — uses default encryption.
# Without kms_key_id the group relies on the AWS-managed key; customers
# cannot rotate or scope access. The rule flags groups that omit
# kms_key_id; fix by setting it to a CMK ARN.
# ruleid: aws-cloudwatch-log-group-unencrypted
resource "aws_cloudwatch_log_group" "bad1" {
  name = "bad1"
}
# ruleid: aws-cloudwatch-log-group-unencrypted
resource "aws_cloudwatch_log_group" "bad2" {
  name = "bad2"
}
# ok: aws-cloudwatch-log-group-unencrypted
resource "aws_cloudwatch_log_group" "good1" {
  name       = "good1"
  kms_key_id = "arn:aws:kms:us-east-1:123456789012:key/abcd"
}
# ok: aws-cloudwatch-log-group-unencrypted
resource "aws_cloudwatch_log_group" "good2" {
  name       = "good2"
  kms_key_id = "arn:aws:kms:us-east-1:123456789012:key/efgh"
}

# ok: aws-cloudwatch-log-group-unencrypted
resource "aws_cloudwatch_log_group" "ok3" {
  name       = "ok3"
  kms_key_id = aws_kms_key.example.arn
}
