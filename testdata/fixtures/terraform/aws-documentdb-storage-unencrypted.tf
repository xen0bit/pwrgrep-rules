# CWE-311: DocumentDB cluster without storage encryption.
# Omitting storage_encrypted leaves the cluster unencrypted at rest;
# AWS defaults to unencrypted. The rule flags clusters without
# storage_encrypted = true; fix by enabling it.
# ruleid: aws-documentdb-storage-unencrypted
resource "aws_docdb_cluster" "bad1" {
  cluster_identifier = "bad1"
  master_username    = "admin"
  master_password    = "password"
}
# ruleid: aws-documentdb-storage-unencrypted
resource "aws_docdb_cluster" "bad2" {
  cluster_identifier = "bad2"
  master_username    = "admin"
  master_password    = "password"
}
# ok: aws-documentdb-storage-unencrypted
resource "aws_docdb_cluster" "good1" {
  cluster_identifier = "good1"
  master_username    = "admin"
  master_password    = "password"
  storage_encrypted  = true
}
# ok: aws-documentdb-storage-unencrypted
resource "aws_docdb_cluster" "good2" {
  cluster_identifier = "good2"
  master_username    = "admin"
  master_password    = "password"
  storage_encrypted  = true
}

# ok: aws-documentdb-storage-unencrypted
resource "aws_docdb_cluster" "ok3" {
  cluster_identifier = "ok3"
  master_username    = "admin"
  master_password    = "password"
  storage_encrypted  = true
  kms_key_id         = aws_kms_key.example.arn
}
