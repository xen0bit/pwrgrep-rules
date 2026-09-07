# Fixture for aws-docdb-encrypted-with-cmk.
# ruleid: aws-docdb-encrypted-with-cmk
resource "aws_docdb_cluster" "bad1" {
}
# ruleid: aws-docdb-encrypted-with-cmk
resource "aws_docdb_cluster" "bad2" {
}
# ok: aws-docdb-encrypted-with-cmk
resource "aws_docdb_cluster" "good1" {
  kms_key_id = "good1-val"
}
# ok: aws-docdb-encrypted-with-cmk
resource "aws_docdb_cluster" "good2" {
  kms_key_id = "good2-val"
}
