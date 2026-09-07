# Fixture for missing-aws-qldb-deletion-protection.
# ruleid: missing-aws-qldb-deletion-protection
resource "aws_qldb_ledger" "bad1" {
  deletion_protection = false
}
# ruleid: missing-aws-qldb-deletion-protection
resource "aws_qldb_ledger" "bad2" {
  deletion_protection = false
}
# ok: missing-aws-qldb-deletion-protection
resource "aws_qldb_ledger" "good1" {
  deletion_protection = true
}
# ok: missing-aws-qldb-deletion-protection
resource "aws_qldb_ledger" "good2" {
  name = "good2"
}
