# Fixture for aws-kinesis-video-stream-encrypted-with-cmk.
# ruleid: aws-kinesis-video-stream-encrypted-with-cmk
resource "aws_kinesis_video_stream" "bad1" {
}
# ruleid: aws-kinesis-video-stream-encrypted-with-cmk
resource "aws_kinesis_video_stream" "bad2" {
}
# ok: aws-kinesis-video-stream-encrypted-with-cmk
resource "aws_kinesis_video_stream" "good1" {
  kms_key_id = "good1-val"
}
# ok: aws-kinesis-video-stream-encrypted-with-cmk
resource "aws_kinesis_video_stream" "good2" {
  kms_key_id = "good2-val"
}
