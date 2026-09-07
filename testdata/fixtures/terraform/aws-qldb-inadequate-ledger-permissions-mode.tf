# Fixture for aws-qldb-inadequate-ledger-permissions-mode.
# ruleid: aws-qldb-inadequate-ledger-permissions-mode
resource "aws_qldb_ledger" "bad1" {
  permissions_mode = "ALLOW_ALL"
}
# ruleid: aws-qldb-inadequate-ledger-permissions-mode
resource "aws_qldb_ledger" "bad2" {
  permissions_mode = "ALLOW_ALL"
}
# ok: aws-qldb-inadequate-ledger-permissions-mode
resource "aws_qldb_ledger" "good1" {
  permissions_mode = "STANDARD"
}
# ok: aws-qldb-inadequate-ledger-permissions-mode
resource "aws_qldb_ledger" "good2" {
  name = "good2"
}
