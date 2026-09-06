# CWE-778: RDS backup disabled — no retention keeps no backups.
# backup_retention_period = 0 means no automated backups are kept,
# so point-in-time recovery is impossible after failure. The rule
# flags DB instances or clusters with 0; fix by setting 7+ days.
# ruleid: aws-rds-backup-no-retention
resource "aws_db_instance" "bad1" {
  allocated_storage       = 10
  engine                  = "mysql"
  instance_class          = "db.t3.micro"
  backup_retention_period = 0
}
# ruleid: aws-rds-backup-no-retention
resource "aws_rds_cluster" "bad2" {
  cluster_identifier      = "bad2"
  engine                  = "aurora-mysql"
  backup_retention_period = 0
}
# ok: aws-rds-backup-no-retention
resource "aws_db_instance" "good1" {
  allocated_storage       = 10
  engine                  = "mysql"
  instance_class          = "db.t3.micro"
  backup_retention_period = 7
}
# ok: aws-rds-backup-no-retention
resource "aws_rds_cluster" "good2" {
  cluster_identifier      = "good2"
  engine                  = "aurora-mysql"
  backup_retention_period = 7
}
# ok: aws-rds-backup-no-retention
resource "aws_db_instance" "ok3" {
  allocated_storage       = 10
  engine                  = "mysql"
  instance_class          = "db.t3.micro"
  backup_retention_period = 14
}
