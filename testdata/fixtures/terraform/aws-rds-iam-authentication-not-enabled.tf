# Fixture for aws-rds-iam-authentication-not-enabled.
# ruleid: aws-rds-iam-authentication-not-enabled
resource "aws_db_instance" "bad1" {
}
# ruleid: aws-rds-iam-authentication-not-enabled
resource "aws_db_instance" "bad2" {
}
# ok: aws-rds-iam-authentication-not-enabled
resource "aws_db_instance" "good1" {
  iam_database_authentication_enabled = true
}
# ok: aws-rds-iam-authentication-not-enabled
resource "aws_db_instance" "good2" {
  iam_database_authentication_enabled = true
}
