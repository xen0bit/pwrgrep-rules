# Fixture for aws-athena-database-unencrypted.
# ruleid: aws-athena-database-unencrypted
resource "aws_athena_database" "bad1" {
}
# ruleid: aws-athena-database-unencrypted
resource "aws_athena_database" "bad2" {
}
# ok: aws-athena-database-unencrypted
resource "aws_athena_database" "good1" {
  encryption_configuration {
  }
}
# ok: aws-athena-database-unencrypted
resource "aws_athena_database" "good2" {
  encryption_configuration {
  }
}
