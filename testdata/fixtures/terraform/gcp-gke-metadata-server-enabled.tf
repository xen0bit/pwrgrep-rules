# Fixture for gcp-gke-metadata-server-enabled.
# ruleid: gcp-gke-metadata-server-enabled
resource "google_container_cluster" "bad1" {
  name = "bad1"
}
# ruleid: gcp-gke-metadata-server-enabled
resource "google_container_cluster" "bad2" {
  name = "bad2"
}
# ok: gcp-gke-metadata-server-enabled
resource "google_container_cluster" "good1" {
node_config {
  workload_metadata_config {
    node_metadata = "GKE_METADATA_SERVER"
  }
}
}
# ok: gcp-gke-metadata-server-enabled
resource "google_container_cluster" "good2" {
node_config {
  workload_metadata_config {
    mode = "GKE_METADATA"
  }
}
}
