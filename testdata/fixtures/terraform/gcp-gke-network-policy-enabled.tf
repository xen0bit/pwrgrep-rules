# Fixture for gcp-gke-network-policy-enabled.
# ruleid: gcp-gke-network-policy-enabled
resource "google_container_cluster" "bad1" {
network_policy {
  enabled = false
}
}
# ruleid: gcp-gke-network-policy-enabled
resource "google_container_cluster" "bad2" {
network_policy {
  enabled = false
}
}
# ok: gcp-gke-network-policy-enabled
resource "google_container_cluster" "good1" {
datapath_provider = "ADVANCED_DATAPATH"
network_policy {
  enabled = false
}
}
# ok: gcp-gke-network-policy-enabled
resource "google_container_cluster" "good2" {
datapath_provider = "ADVANCED_DATAPATH"
network_policy {
  enabled = false
}
}
