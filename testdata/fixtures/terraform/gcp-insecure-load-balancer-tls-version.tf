# Fixture for gcp-insecure-load-balancer-tls-version.
# ruleid: gcp-insecure-load-balancer-tls-version
resource "google_compute_ssl_policy" "bad1" {
  min_tls_version = "bad1-val"
}
# ruleid: gcp-insecure-load-balancer-tls-version
resource "google_compute_ssl_policy" "bad2" {
  min_tls_version = "bad2-val"
}
# ok: gcp-insecure-load-balancer-tls-version
resource "google_compute_ssl_policy" "good1" {
  min_tls_version = "TLS_1_2"
}
# ok: gcp-insecure-load-balancer-tls-version
resource "google_compute_ssl_policy" "good2" {
  min_tls_version = "TLS_1_2"
}
