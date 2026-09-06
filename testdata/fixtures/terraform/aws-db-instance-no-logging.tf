# CWE-778: DB instance without CloudWatch audit exports.
# Missing enabled_cloudwatch_logs_exports means audit/error logs never
# reach CloudWatch, blinding detection. The rule flags instances that
# omit that list; fix by exporting audit, error, or general logs.
# ruleid: aws-db-instance-no-logging
resource "aws_db_instance" "bad1" {
  identifier     = "bad1"
  engine         = "mysql"
  instance_class = "db.t3.micro"
}
# ruleid: aws-db-instance-no-logging
resource "aws_db_instance" "bad2" {
  identifier     = "bad2"
  engine         = "mysql"
  instance_class = "db.t3.micro"
}
# ok: aws-db-instance-no-logging
resource "aws_db_instance" "good1" {
  identifier                      = "good1"
  engine                          = "mysql"
  instance_class                  = "db.t3.micro"
  enabled_cloudwatch_logs_exports = ["audit"]
}
# ok: aws-db-instance-no-logging
resource "aws_db_instance" "good2" {
  identifier                      = "good2"
  engine                          = "mysql"
  instance_class                  = "db.t3.micro"
  enabled_cloudwatch_logs_exports = ["error", "general"]
}

# ok: aws-db-instance-no-logging
resource "aws_db_instance" "ok3" {
  identifier                      = "ok3"
  engine                          = "mysql"
  instance_class                  = "db.t3.micro"
  enabled_cloudwatch_logs_exports = ["audit", "error"]
}
