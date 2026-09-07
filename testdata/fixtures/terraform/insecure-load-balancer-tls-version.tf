# Fixture for insecure-load-balancer-tls-version.
resource "example" "bad1" {
# ruleid: insecure-load-balancer-tls-version
  ssl_policy = "example-val"
}
resource "example" "bad2" {
# ruleid: insecure-load-balancer-tls-version
  protocol = "HTTP"
}
# ok: insecure-load-balancer-tls-version
resource "example" "good1" {
  name = "good1"
}
# ok: insecure-load-balancer-tls-version
resource "example" "good2" {
  name = "good2"
}
