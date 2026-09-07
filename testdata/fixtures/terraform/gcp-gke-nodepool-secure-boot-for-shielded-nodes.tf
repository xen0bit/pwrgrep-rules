# Fixture for gcp-gke-nodepool-secure-boot-for-shielded-nodes.
# ruleid: gcp-gke-nodepool-secure-boot-for-shielded-nodes
resource "google_container_node_pool" "bad1" {
  name = "bad1"
}
# ruleid: gcp-gke-nodepool-secure-boot-for-shielded-nodes
resource "google_container_node_pool" "bad2" {
  name = "bad2"
}
# ok: gcp-gke-nodepool-secure-boot-for-shielded-nodes
resource "google_container_node_pool" "good1" {
shielded_instance_config {
  enable_secure_boot = true
}
}
# ok: gcp-gke-nodepool-secure-boot-for-shielded-nodes
resource "google_container_node_pool" "good2" {
shielded_instance_config {
  enable_secure_boot = true
}
}
