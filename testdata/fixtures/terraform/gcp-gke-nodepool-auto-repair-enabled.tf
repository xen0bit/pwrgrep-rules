# Fixture for gcp-gke-nodepool-auto-repair-enabled.
# ruleid: gcp-gke-nodepool-auto-repair-enabled
resource "google_container_node_pool" "bad1" {
management {
  auto_repair  = false
}
}
# ruleid: gcp-gke-nodepool-auto-repair-enabled
resource "google_container_node_pool" "bad2" {
management {
  auto_repair  = false
}
}
# ok: gcp-gke-nodepool-auto-repair-enabled
resource "google_container_node_pool" "good1" {
management {
  auto_repair  = true
}
}
# ok: gcp-gke-nodepool-auto-repair-enabled
resource "google_container_node_pool" "good2" {
  name = "good2"
}
