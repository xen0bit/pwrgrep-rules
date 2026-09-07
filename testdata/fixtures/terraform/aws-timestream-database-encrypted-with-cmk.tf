# Fixture for aws-timestream-database-encrypted-with-cmk.
# ruleid: aws-timestream-database-encrypted-with-cmk
resource "aws_timestreamwrite_database" "bad1" {
}
# ruleid: aws-timestream-database-encrypted-with-cmk
resource "aws_timestreamwrite_database" "bad2" {
}
# ok: aws-timestream-database-encrypted-with-cmk
resource "aws_timestreamwrite_database" "good1" {
  kms_key_id = "good1-val"
}
# ok: aws-timestream-database-encrypted-with-cmk
resource "aws_timestreamwrite_database" "good2" {
  kms_key_id = "good2-val"
}
