# Fixture for aws-dynamodb-point-in-time-recovery-disabled.
# ruleid: aws-dynamodb-point-in-time-recovery-disabled
resource "aws_dynamodb_table" "bad1" {
}
# ruleid: aws-dynamodb-point-in-time-recovery-disabled
resource "aws_dynamodb_table" "bad2" {
}
# ok: aws-dynamodb-point-in-time-recovery-disabled
resource "aws_dynamodb_table" "good1" {
  point_in_time_recovery {
    enabled = true
  }
}
# ok: aws-dynamodb-point-in-time-recovery-disabled
resource "aws_dynamodb_table" "good2" {
  point_in_time_recovery {
    enabled = true
  }
}
