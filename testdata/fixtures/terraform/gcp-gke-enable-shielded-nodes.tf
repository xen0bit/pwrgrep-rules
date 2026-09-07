# Fixture for gcp-gke-enable-shielded-nodes.
# ruleid: gcp-gke-enable-shielded-nodes
resource "google_container_cluster" "bad1" {
enable_shielded_nodes = false
}
# ruleid: gcp-gke-enable-shielded-nodes
resource "google_container_cluster" "bad2" {
enable_shielded_nodes = false
}
# ok: gcp-gke-enable-shielded-nodes
resource "google_container_cluster" "good1" {
enable_shielded_nodes = true
}
# ok: gcp-gke-enable-shielded-nodes
resource "google_container_cluster" "good2" {
  name = "good2"
}
