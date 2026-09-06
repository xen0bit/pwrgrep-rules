# CWE-404: RDS without backup retention.
# ruleid: aws-rds-backup-retention
resource "aws_db_instance" "bad1" {
  identifier              = "bad1"
  instance_class          = "db.t3.micro"
  engine                  = "mysql"
  backup_retention_period = 0
}
# ruleid: aws-rds-backup-retention
resource "aws_rds_cluster" "bad2" {
  cluster_identifier      = "bad2"
  engine                  = "aurora-mysql"
  backup_retention_period = 0
}
# ok: aws-rds-backup-retention
resource "aws_db_instance" "good1" {
  identifier              = "good1"
  instance_class          = "db.t3.micro"
  engine                  = "mysql"
  backup_retention_period = 7
}
# ok: aws-rds-backup-retention
resource "aws_db_instance" "good2" {
  identifier              = "good2"
  instance_class          = "db.t3.micro"
  engine                  = "postgres"
  backup_retention_period = 30
}
# ok: aws-rds-backup-retention
resource "aws_rds_cluster" "good3" {
  cluster_identifier      = "good3"
  engine                  = "aurora-postgresql"
  backup_retention_period = 14
}
