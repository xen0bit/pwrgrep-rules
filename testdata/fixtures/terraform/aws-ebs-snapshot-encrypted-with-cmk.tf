# Fixture for aws-ebs-snapshot-encrypted-with-cmk.
# ruleid: aws-ebs-snapshot-encrypted-with-cmk
resource "aws_ebs_snapshot_copy" "bad1" {
  encrypted = true
}
# ruleid: aws-ebs-snapshot-encrypted-with-cmk
resource "aws_ebs_snapshot_copy" "bad2" {
  encrypted = true
}
# ok: aws-ebs-snapshot-encrypted-with-cmk
resource "aws_ebs_snapshot_copy" "good1" {
  encrypted = true
  kms_key_id = "good1-val"
}
# ok: aws-ebs-snapshot-encrypted-with-cmk
resource "aws_ebs_snapshot_copy" "good2" {
  encrypted = true
  kms_key_id = "good2-val"
}
