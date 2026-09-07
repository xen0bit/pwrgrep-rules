# Fixture for aws-fsx-windows-encrypted-with-cmk.
# ruleid: aws-fsx-windows-encrypted-with-cmk
resource "aws_fsx_windows_file_system" "bad1" {
}
# ruleid: aws-fsx-windows-encrypted-with-cmk
resource "aws_fsx_windows_file_system" "bad2" {
}
# ok: aws-fsx-windows-encrypted-with-cmk
resource "aws_fsx_windows_file_system" "good1" {
  kms_key_id = "good1-val"
}
# ok: aws-fsx-windows-encrypted-with-cmk
resource "aws_fsx_windows_file_system" "good2" {
  kms_key_id = "good2-val"
}
