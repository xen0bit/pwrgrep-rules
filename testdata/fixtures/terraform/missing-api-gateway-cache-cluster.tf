# Fixture for missing-api-gateway-cache-cluster.
# ruleid: missing-api-gateway-cache-cluster
resource "aws_api_gateway_stage" "bad1" {
}
# ruleid: missing-api-gateway-cache-cluster
resource "aws_api_gateway_stage" "bad2" {
}
# ok: missing-api-gateway-cache-cluster
resource "aws_api_gateway_stage" "good1" {
  cache_cluster_enabled = true
}
# ok: missing-api-gateway-cache-cluster
resource "aws_api_gateway_stage" "good2" {
  cache_cluster_enabled = true
}
