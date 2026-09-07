# Fixture for gcp-gke-private-cluster-config.
# ruleid: gcp-gke-private-cluster-config
resource "google_container_cluster" "bad1" {
  name = "bad1"
}
# ruleid: gcp-gke-private-cluster-config
resource "google_container_cluster" "bad2" {
  name = "bad2"
}
# ok: gcp-gke-private-cluster-config
resource "google_container_cluster" "good1" {
private_cluster_config {
}
}
# ok: gcp-gke-private-cluster-config
resource "google_container_cluster" "good2" {
private_cluster_config {
}
}
