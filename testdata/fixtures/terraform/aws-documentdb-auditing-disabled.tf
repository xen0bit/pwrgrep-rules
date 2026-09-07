# Fixture for aws-documentdb-auditing-disabled.
# ruleid: aws-documentdb-auditing-disabled
resource "aws_docdb_cluster" "bad1" {
}
# ruleid: aws-documentdb-auditing-disabled
resource "aws_docdb_cluster" "bad2" {
}
# ok: aws-documentdb-auditing-disabled
resource "aws_docdb_cluster" "good1" {
  enabled_cloudwatch_logs_exports = [ "audit"]
}
# ok: aws-documentdb-auditing-disabled
resource "aws_docdb_cluster" "good2" {
  enabled_cloudwatch_logs_exports = [ "audit"]
}
