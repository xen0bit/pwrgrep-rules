# CWE-311: EFS file system encrypted without CMK.
# encrypted = true alone uses the AWS-managed key; without kms_key_id
# the customer cannot manage rotation. The rule flags file systems that
# omit kms_key_id; fix by setting it to a CMK.
# ruleid: aws-efs-filesystem-encrypted-with-cmk
resource "aws_efs_file_system" "bad1" {
  creation_token = "bad1"
  encrypted      = true
}
# ruleid: aws-efs-filesystem-encrypted-with-cmk
resource "aws_efs_file_system" "bad2" {
  creation_token = "bad2"
  encrypted      = true
}
# ok: aws-efs-filesystem-encrypted-with-cmk
resource "aws_efs_file_system" "good1" {
  creation_token = "good1"
  encrypted      = true
  kms_key_id     = "arn:aws:kms:us-east-1:123456789012:key/abcd"
}
# ok: aws-efs-filesystem-encrypted-with-cmk
resource "aws_efs_file_system" "good2" {
  creation_token = "good2"
  encrypted      = true
  kms_key_id     = "arn:aws:kms:us-east-1:123456789012:key/efgh"
}

# ok: aws-efs-filesystem-encrypted-with-cmk
resource "aws_efs_file_system" "ok3" {
  creation_token = "ok3"
  encrypted      = true
  kms_key_id     = aws_kms_key.example.arn
}
