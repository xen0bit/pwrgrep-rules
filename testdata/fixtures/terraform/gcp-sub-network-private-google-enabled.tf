# Fixture for gcp-sub-network-private-google-enabled.
# ruleid: gcp-sub-network-private-google-enabled
resource "google_compute_subnetwork" "bad1" {
  name = "bad1"
}
# ruleid: gcp-sub-network-private-google-enabled
resource "google_compute_subnetwork" "bad2" {
  name = "bad2"
}
# ok: gcp-sub-network-private-google-enabled
resource "google_compute_subnetwork" "good1" {
private_ip_google_access = true
}
# ok: gcp-sub-network-private-google-enabled
resource "google_compute_subnetwork" "good2" {
private_ip_google_access = true
}
