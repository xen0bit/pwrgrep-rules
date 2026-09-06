# CWE-311: SQS queue without KMS — unencrypted messages.
# A queue needs kms_master_key_id or sqs_managed_sse_enabled = true;
# omitting both leaves contents unencrypted. The rule flags such queues;
# fix with either attribute.
# ruleid: aws-sqs-queue-unencrypted
resource "aws_sqs_queue" "bad1" {
  name = "bad1"
}
# ruleid: aws-sqs-queue-unencrypted
resource "aws_sqs_queue" "bad2" {
  name = "bad2"
}
# ok: aws-sqs-queue-unencrypted
resource "aws_sqs_queue" "good1" {
  name              = "good1"
  kms_master_key_id = "alias/aws/sqs"
}
# ok: aws-sqs-queue-unencrypted
resource "aws_sqs_queue" "good2" {
  name                      = "good2"
  sqs_managed_sse_enabled = true
}

# ok: aws-sqs-queue-unencrypted
resource "aws_sqs_queue" "ok3" {
  name              = "ok3"
  kms_master_key_id = aws_kms_key.example.arn
}
