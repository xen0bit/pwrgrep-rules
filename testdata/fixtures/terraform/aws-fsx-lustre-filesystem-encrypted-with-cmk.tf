# Fixture for aws-fsx-lustre-filesystem-encrypted-with-cmk.
# ruleid: aws-fsx-lustre-filesystem-encrypted-with-cmk
resource "aws_fsx_lustre_file_system" "bad1" {
}
# ruleid: aws-fsx-lustre-filesystem-encrypted-with-cmk
resource "aws_fsx_lustre_file_system" "bad2" {
}
# ok: aws-fsx-lustre-filesystem-encrypted-with-cmk
resource "aws_fsx_lustre_file_system" "good1" {
  kms_key_id = "arn:aws:kms:us-east-1:1234:key/abc"
}
# ok: aws-fsx-lustre-filesystem-encrypted-with-cmk
resource "aws_fsx_lustre_file_system" "good2" {
  kms_key_id = "arn:aws:kms:us-west-2:5678:key/def"
}
