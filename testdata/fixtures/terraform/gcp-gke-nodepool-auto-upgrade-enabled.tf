# Fixture for gcp-gke-nodepool-auto-upgrade-enabled.
# ruleid: gcp-gke-nodepool-auto-upgrade-enabled
resource "google_container_node_pool" "bad1" {
management {
  auto_upgrade = false
}
}
# ruleid: gcp-gke-nodepool-auto-upgrade-enabled
resource "google_container_node_pool" "bad2" {
management {
  auto_upgrade = false
}
}
# ok: gcp-gke-nodepool-auto-upgrade-enabled
resource "google_container_node_pool" "good1" {
management {
  auto_upgrade = true
}
}
# ok: gcp-gke-nodepool-auto-upgrade-enabled
resource "google_container_node_pool" "good2" {
  name = "good2"
}
