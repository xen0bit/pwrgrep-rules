# CWE-284: RDS publicly accessible.
resource "aws_db_instance" "bad1" {
  identifier          = "bad1"
  instance_class      = "db.t3.micro"
  engine              = "mysql"
# ruleid: rds-public-access
  publicly_accessible = true
}
resource "aws_db_instance" "bad2" {
  identifier          = "bad2"
  instance_class      = "db.t3.micro"
  engine              = "postgres"
# ruleid: rds-public-access
  publicly_accessible = true
  allocated_storage   = 20
}
# ok: rds-public-access
resource "aws_db_instance" "good1" {
  identifier          = "good1"
  instance_class      = "db.t3.micro"
  engine              = "mysql"
  publicly_accessible = false
}
# ok: rds-public-access
resource "aws_db_instance" "good2" {
  identifier     = "good2"
  instance_class = "db.t3.micro"
  engine         = "mysql"
}
resource "aws_db_instance" "bad3" {
  identifier          = "bad3"
  instance_class      = "db.t3.micro"
  engine              = "mysql"
# ruleid: rds-public-access
  publicly_accessible = true
  skip_final_snapshot = true
}
resource "aws_db_instance" "bad4" {
  identifier          = "bad4"
  instance_class      = "db.t3.small"
  engine              = "postgres"
# ruleid: rds-public-access
  publicly_accessible = true
  storage_encrypted   = true
}
# ok: rds-public-access
resource "aws_db_instance" "good3" {
  identifier          = "good3"
  instance_class      = "db.t3.micro"
  engine              = "mysql"
  publicly_accessible = false
  backup_retention_period = 7
}
