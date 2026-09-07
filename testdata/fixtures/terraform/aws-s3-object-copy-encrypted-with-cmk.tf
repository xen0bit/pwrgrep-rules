# Fixture for aws-s3-object-copy-encrypted-with-cmk.
# ruleid: aws-s3-object-copy-encrypted-with-cmk
resource "aws_s3_object_copy" "bad1" {
}
# ruleid: aws-s3-object-copy-encrypted-with-cmk
resource "aws_s3_object_copy" "bad2" {
}
# ok: aws-s3-object-copy-encrypted-with-cmk
resource "aws_s3_object_copy" "good1" {
  kms_key_id = "good1-val"
}
# ok: aws-s3-object-copy-encrypted-with-cmk
resource "aws_s3_object_copy" "good2" {
  kms_key_id = "good2-val"
}
