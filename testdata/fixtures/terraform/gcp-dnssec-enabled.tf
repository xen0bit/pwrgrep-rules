# Fixture for gcp-dnssec-enabled.
# ruleid: gcp-dnssec-enabled
resource "google_dns_managed_zone" "bad1" {
  name = "bad1"
}
# ruleid: gcp-dnssec-enabled
resource "google_dns_managed_zone" "bad2" {
  name = "bad2"
}
# ok: gcp-dnssec-enabled
resource "google_dns_managed_zone" "good1" {
dnssec_config {
    state = on
}
}
# ok: gcp-dnssec-enabled
resource "google_dns_managed_zone" "good2" {
dnssec_config {
    state = on
}
}
