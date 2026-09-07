# Fixture for aws-elasticsearch-nodetonode-encryption-not-enabled.
# ruleid: aws-elasticsearch-nodetonode-encryption-not-enabled
resource "aws_elasticsearch_domain" "bad1" {
  domain_name = "bad1"
  cluster_config {
    instance_count = 2
  }
}
# The cluster_config block must close the resource: the AST patterns read
# the blocks in order, so encryption comes first here.
# ruleid: aws-elasticsearch-nodetonode-encryption-not-enabled
resource "aws_elasticsearch_domain" "bad2" {
  domain_name = "bad2"
  node_to_node_encryption {
    enabled = false
  }
  cluster_config {
    instance_count = 3
  }
}
# ok: aws-elasticsearch-nodetonode-encryption-not-enabled
resource "aws_elasticsearch_domain" "good1" {
  domain_name = "good1"
  cluster_config {
    instance_count = 2
  }
  node_to_node_encryption {
    enabled = true
  }
}
# ok: aws-elasticsearch-nodetonode-encryption-not-enabled
resource "aws_elasticsearch_domain" "good2" {
  domain_name = "good2"
  cluster_config {
    instance_count = 1
  }
}
