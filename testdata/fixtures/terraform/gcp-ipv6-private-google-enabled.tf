# Fixture for gcp-ipv6-private-google-enabled.
# ruleid: gcp-ipv6-private-google-enabled
resource "google_compute_subnetwork" "bad1" {
  name = "bad1"
}
# ruleid: gcp-ipv6-private-google-enabled
resource "google_compute_subnetwork" "bad2" {
  name = "bad2"
}
# ok: gcp-ipv6-private-google-enabled
resource "google_compute_subnetwork" "good1" {
  private_ipv6_google_access = "ENABLE_OUTBOUND_VM_ACCESS_TO_GOOGLE"
}
# ok: gcp-ipv6-private-google-enabled
resource "google_compute_subnetwork" "good2" {
  private_ipv6_google_access = "ENABLE_BIDIRECTIONAL_ACCESS_TO_GOOGLE"
}
