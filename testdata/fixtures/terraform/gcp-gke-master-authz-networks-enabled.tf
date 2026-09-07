# Fixture for gcp-gke-master-authz-networks-enabled.
# ruleid: gcp-gke-master-authz-networks-enabled
resource "google_container_cluster" "bad1" {
  name = "bad1"
}
# ruleid: gcp-gke-master-authz-networks-enabled
resource "google_container_cluster" "bad2" {
  name = "bad2"
}
# ok: gcp-gke-master-authz-networks-enabled
resource "google_container_cluster" "good1" {
master_authorized_networks_config {
}
}
# ok: gcp-gke-master-authz-networks-enabled
resource "google_container_cluster" "good2" {
master_authorized_networks_config {
}
}
