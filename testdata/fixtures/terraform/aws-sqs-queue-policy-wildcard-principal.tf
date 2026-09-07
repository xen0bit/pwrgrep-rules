# Fixture for aws-sqs-queue-policy-wildcard-principal.
# Only the quoted policy= branch can fire (see the ecr fixture for why).
# Values below are single tokens, the only shape that branch reads.
resource "aws_sqs_queue_policy" "bad1" {
  queue_url = "https://queue.amazonaws.com/123456789012/bad1"
# ruleid: aws-sqs-queue-policy-wildcard-principal
  policy = "allow-star"
}
resource "aws_sqs_queue_policy" "bad2" {
  queue_url = "https://queue.amazonaws.com/123456789012/bad2"
# ruleid: aws-sqs-queue-policy-wildcard-principal
  policy = "allow-star"
}
# ok: aws-sqs-queue-policy-wildcard-principal
resource "aws_sqs_queue_policy" "good1" {
  queue_url = "https://queue.amazonaws.com/123456789012/good1"
}
# ok: aws-sqs-queue-policy-wildcard-principal
resource "aws_sqs_queue" "good2" {
  name = "good2"
}
