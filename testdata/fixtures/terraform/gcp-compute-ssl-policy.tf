# Fixture for gcp-compute-ssl-policy.
# ruleid: gcp-compute-ssl-policy
resource "google_compute_ssl_policy" "bad1" {
profile = "MODERN"
}
# ruleid: gcp-compute-ssl-policy
resource "google_compute_ssl_policy" "bad2" {
profile = "CUSTOM"
custom_features = [ "TLS_RSA_WITH_AES_256_GCM_SHA384"]
}
# ok: gcp-compute-ssl-policy
resource "google_compute_ssl_policy" "good1" {
profile = "MODERN"
min_tls_version = "TLS_1_2"
}
# ok: gcp-compute-ssl-policy
resource "google_compute_ssl_policy" "good2" {
profile = "CUSTOM"
custom_features = ["TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384", "TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384"]
}
