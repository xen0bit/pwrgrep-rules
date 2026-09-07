# Fixture for gcp-sub-network-logging-enabled.
# ruleid: gcp-sub-network-logging-enabled
resource "google_compute_subnetwork" "bad1" {
}
# ruleid: gcp-sub-network-logging-enabled
resource "google_compute_subnetwork" "bad2" {
}
# ok: gcp-sub-network-logging-enabled
resource "google_compute_subnetwork" "good1" {
  log_config {
  }        
}
# ok: gcp-sub-network-logging-enabled
resource "google_compute_subnetwork" "good2" {
  log_config {
  }        
}
