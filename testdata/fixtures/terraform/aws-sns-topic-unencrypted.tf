# CWE-311: SNS topic without KMS — unencrypted at rest.
# Omitting kms_master_key_id leaves the topic unencrypted. The rule
# flags topics without it; fix by setting kms_master_key_id to a CMK.
# ruleid: aws-sns-topic-unencrypted
resource "aws_sns_topic" "bad1" {
  name = "bad1"
}
# ruleid: aws-sns-topic-unencrypted
resource "aws_sns_topic" "bad2" {
  name = "bad2"
}
# ok: aws-sns-topic-unencrypted
resource "aws_sns_topic" "good1" {
  name              = "good1"
  kms_master_key_id = "alias/aws/sns"
}
# ok: aws-sns-topic-unencrypted
resource "aws_sns_topic" "good2" {
  name              = "good2"
  kms_master_key_id = "alias/aws/sns2"
}

# ok: aws-sns-topic-unencrypted
resource "aws_sns_topic" "ok3" {
  name              = "ok3"
  kms_master_key_id = aws_kms_key.example.arn
}
