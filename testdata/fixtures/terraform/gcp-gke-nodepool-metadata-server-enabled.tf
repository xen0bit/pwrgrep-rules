# Fixture for gcp-gke-nodepool-metadata-server-enabled.
# ruleid: gcp-gke-nodepool-metadata-server-enabled
resource "google_container_node_pool" "bad1" {
  name = "bad1"
}
# ruleid: gcp-gke-nodepool-metadata-server-enabled
resource "google_container_node_pool" "bad2" {
  name = "bad2"
}
# ok: gcp-gke-nodepool-metadata-server-enabled
resource "google_container_node_pool" "good1" {
node_config {
  workload_metadata_config {
    node_metadata = "GKE_METADATA_SERVER"
  }
}
}
# ok: gcp-gke-nodepool-metadata-server-enabled
resource "google_container_node_pool" "good2" {
node_config {
  workload_metadata_config {
    mode = "GKE_METADATA"
  }
}
}
