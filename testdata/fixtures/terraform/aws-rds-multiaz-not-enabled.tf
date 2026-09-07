# Fixture for aws-rds-multiaz-not-enabled.
# ruleid: aws-rds-multiaz-not-enabled
resource "aws_db_instance" "bad1" {
}
# ruleid: aws-rds-multiaz-not-enabled
resource "aws_db_instance" "bad2" {
}
# ok: aws-rds-multiaz-not-enabled
resource "aws_db_instance" "good1" {
  multi_az = true
}
# ok: aws-rds-multiaz-not-enabled
resource "aws_db_instance" "good2" {
  multi_az = true
}
