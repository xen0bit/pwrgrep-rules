# Fixture for gcp-gke-alias-ip-enabled.
# ruleid: gcp-gke-alias-ip-enabled
resource "google_container_cluster" "bad1" {
  name = "bad1"
}
# ruleid: gcp-gke-alias-ip-enabled
resource "google_container_cluster" "bad2" {
  name = "bad2"
}
# ok: gcp-gke-alias-ip-enabled
resource "google_container_cluster" "good1" {
ip_allocation_policy {
  use_ip_aliases = "false"
}
}
# ok: gcp-gke-alias-ip-enabled
resource "google_container_cluster" "good2" {
ip_allocation_policy {
  use_ip_aliases = "false"
}
}
