# CWE-311: Kinesis stream without KMS encryption.
# Omitting encryption_type = "KMS" leaves the stream using no
# encryption or the default. The rule flags streams without that value;
# fix by setting encryption_type = "KMS" (and optionally kms_key_id).
# ruleid: aws-kinesis-stream-unencrypted
resource "aws_kinesis_stream" "bad1" {
  name        = "bad1"
  shard_count = 1
}
# ruleid: aws-kinesis-stream-unencrypted
resource "aws_kinesis_stream" "bad2" {
  name        = "bad2"
  shard_count = 1
}
# ok: aws-kinesis-stream-unencrypted
resource "aws_kinesis_stream" "good1" {
  name            = "good1"
  shard_count     = 1
  encryption_type = "KMS"
}
# ok: aws-kinesis-stream-unencrypted
resource "aws_kinesis_stream" "good2" {
  name            = "good2"
  shard_count     = 1
  encryption_type = "KMS"
  kms_key_id      = "arn:aws:kms:us-east-1:123456789012:key/abcd"
}

# ok: aws-kinesis-stream-unencrypted
resource "aws_kinesis_stream" "ok3" {
  name            = "ok3"
  shard_count     = 1
  encryption_type = "KMS"
  kms_key_id      = aws_kms_key.example.arn
}
