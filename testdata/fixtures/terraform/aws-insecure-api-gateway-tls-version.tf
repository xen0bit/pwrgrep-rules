# Fixture for aws-insecure-api-gateway-tls-version.
# Ok blocks come first: the TLS_1_2 exclusion spans forward otherwise. The
# block pattern needs trailing content after security_policy, so it is never
# last in a block.
# ok: aws-insecure-api-gateway-tls-version
resource "aws_api_gateway_domain_name" "good1" {
  domain_name = "good1.example.com"
  security_policy = "TLS_1_2"
  tags = "good1"
}
# ok: aws-insecure-api-gateway-tls-version
resource "aws_api_gateway_domain_name" "good2" {
  domain_name = "good2.example.com"
  security_policy = "TLS_1_2"
  tags = "good2"
}
# ruleid: aws-insecure-api-gateway-tls-version
resource "aws_api_gateway_domain_name" "bad1" {
  domain_name = "bad1.example.com"
  security_policy = "TLS_1_0"
  tags = "bad1"
}
# ruleid: aws-insecure-api-gateway-tls-version
resource "aws_api_gateway_domain_name" "bad2" {
  domain_name = "bad2.example.com"
  security_policy = "TLS_1"
  tags = "bad2"
}
