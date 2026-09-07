# Fixture for rds-insecure-password-storage-in-source-code.
resource "aws_db_instance" "bad1" {
# ruleid: rds-insecure-password-storage-in-source-code
  password = "hardcoded123"
}
resource "aws_rds_cluster" "bad2" {
# ruleid: rds-insecure-password-storage-in-source-code
  master_password = "hardcoded456"
}
# ok: rds-insecure-password-storage-in-source-code
resource "aws_db_instance" "good1" {
  name = "good1"
}
# ok: rds-insecure-password-storage-in-source-code
resource "aws_rds_cluster" "good2" {
  name = "good2"
}
