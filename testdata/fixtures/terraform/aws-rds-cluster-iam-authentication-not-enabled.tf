# Fixture for aws-rds-cluster-iam-authentication-not-enabled.
# ruleid: aws-rds-cluster-iam-authentication-not-enabled
resource "aws_rds_cluster" "bad1" {
}
# ruleid: aws-rds-cluster-iam-authentication-not-enabled
resource "aws_rds_cluster" "bad2" {
}
# ok: aws-rds-cluster-iam-authentication-not-enabled
resource "aws_rds_cluster" "good1" {
  iam_database_authentication_enabled = true
}
# ok: aws-rds-cluster-iam-authentication-not-enabled
resource "aws_rds_cluster" "good2" {
  iam_database_authentication_enabled = true
}
