# Fixture for aws-elasticsearch-insecure-tls-version.
# ruleid: aws-elasticsearch-insecure-tls-version
resource "aws_elasticsearch_domain" "bad1" {
  domain_endpoint_options {
    enforce_https = true
    tls_security_policy = "Policy-Min-TLS-1-0-2019-07"
  }
}
# ruleid: aws-elasticsearch-insecure-tls-version
resource "aws_elasticsearch_domain" "bad2" {
  domain_endpoint_options {
    enforce_https = true
    tls_security_policy = "Policy-Min-TLS-1-0-2019-07"
  }
}
# ok: aws-elasticsearch-insecure-tls-version
resource "aws_elasticsearch_domain" "good1" {
  domain_endpoint_options {
    enforce_https = false
    tls_security_policy = "Policy-Min-TLS-1-2-2019-07"
  }
}
# ok: aws-elasticsearch-insecure-tls-version
resource "aws_elasticsearch_domain" "good2" {
  name = "good2"
}
