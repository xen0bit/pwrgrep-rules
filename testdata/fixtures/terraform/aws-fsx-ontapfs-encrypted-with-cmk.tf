# Fixture for aws-fsx-ontapfs-encrypted-with-cmk.
# ruleid: aws-fsx-ontapfs-encrypted-with-cmk
resource "aws_fsx_ontap_file_system" "bad1" {
}
# ruleid: aws-fsx-ontapfs-encrypted-with-cmk
resource "aws_fsx_ontap_file_system" "bad2" {
}
# ok: aws-fsx-ontapfs-encrypted-with-cmk
resource "aws_fsx_ontap_file_system" "good1" {
  kms_key_id = "good1-val"
}
# ok: aws-fsx-ontapfs-encrypted-with-cmk
resource "aws_fsx_ontap_file_system" "good2" {
  kms_key_id = "good2-val"
}
