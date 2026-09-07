# Fixture for gcp-gke-cluster-logging.
# ruleid: gcp-gke-cluster-logging
resource "google_container_cluster" "bad1" {
  logging_service = "none"
}
# ruleid: gcp-gke-cluster-logging
resource "google_container_cluster" "bad2" {
  logging_service = "none"
}
# ok: gcp-gke-cluster-logging
resource "google_container_cluster" "good1" {
  logging_service = "logging.googleapis.com/kubernetes"
}
# ok: gcp-gke-cluster-logging
resource "google_container_cluster" "good2" {
  name = "good2"
}
