# CWE-311: SNS topic without KMS encryption.
# ruleid: aws-sns-topic-encrypted
resource "aws_sns_topic" "bad1" {
  name = "bad1"
}
# ruleid: aws-sns-topic-encrypted
resource "aws_sns_topic" "bad2" {
  name = "bad2"
  display_name = "bad2"
}
# ok: aws-sns-topic-encrypted
resource "aws_sns_topic" "good1" {
  name              = "good1"
  kms_master_key_id = "alias/aws/sns"
}
# ok: aws-sns-topic-encrypted
resource "aws_sns_topic" "good2" {
  name              = "good2"
  kms_master_key_id = aws_kms_key.example.arn
}
# ok: aws-sns-topic-encrypted
resource "aws_sns_topic" "good3" {
  name              = "good3"
  kms_master_key_id = "arn:aws:kms:us-east-1:123456789012:key/abcd1234-a123-456a-a12b-a123b4cd56ef"
}
