# Fixture for gcp-gke-secure-boot-for-shielded-nodes.
# ruleid: gcp-gke-secure-boot-for-shielded-nodes
resource "google_container_cluster" "bad1" {
  name = "bad1"
}
# ruleid: gcp-gke-secure-boot-for-shielded-nodes
resource "google_container_cluster" "bad2" {
  name = "bad2"
}
# ok: gcp-gke-secure-boot-for-shielded-nodes
resource "google_container_cluster" "good1" {
shielded_instance_config {
  enable_secure_boot = true
}
}
# ok: gcp-gke-secure-boot-for-shielded-nodes
resource "google_container_cluster" "good2" {
shielded_instance_config {
  enable_secure_boot = true
}
}
