# Fixture for aws-kinesis-stream-encrypted-with-cmk.
# ruleid: aws-kinesis-stream-encrypted-with-cmk
resource "aws_kinesis_stream" "bad1" {
}
# ruleid: aws-kinesis-stream-encrypted-with-cmk
resource "aws_kinesis_stream" "bad2" {
}
# ok: aws-kinesis-stream-encrypted-with-cmk
resource "aws_kinesis_stream" "good1" {
  kms_key_id = "good1-val"
}
# ok: aws-kinesis-stream-encrypted-with-cmk
resource "aws_kinesis_stream" "good2" {
  kms_key_id = "good2-val"
}
