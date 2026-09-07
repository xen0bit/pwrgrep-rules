# Fixture for elastic-search-encryption-at-rest.
# ruleid: elastic-search-encryption-at-rest
resource "aws_elasticsearch_domain" "bad1" {
  name = "bad1"
}
# ruleid: elastic-search-encryption-at-rest
resource "aws_elasticsearch_domain" "bad2" {
  name = "bad2"
}
# ok: elastic-search-encryption-at-rest
resource "aws_elasticsearch_domain" "good1"{
  encrypt_at_rest{
    enabled = true
  }
}
# ok: elastic-search-encryption-at-rest
resource "aws_elasticsearch_domain" "good2"{
  encrypt_at_rest{
    enabled = true
  }
}
