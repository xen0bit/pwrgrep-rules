# Fixture for aws-elasticache-automatic-backup-not-enabled.
# ruleid: aws-elasticache-automatic-backup-not-enabled
resource "aws_elasticache_cluster" "bad1" {
  engine = "redis"
  node_type = "cache.t3.micro"
}
# ruleid: aws-elasticache-automatic-backup-not-enabled
resource "aws_elasticache_cluster" "bad2" {
  engine = "redis"
  snapshot_retention_limit = 0
}
# ok: aws-elasticache-automatic-backup-not-enabled
resource "aws_elasticache_cluster" "good1" {
  engine = "redis"
  snapshot_retention_limit = 7
}
# ok: aws-elasticache-automatic-backup-not-enabled
resource "aws_elasticache_cluster" "good2" {
  engine = "memcached"
}
