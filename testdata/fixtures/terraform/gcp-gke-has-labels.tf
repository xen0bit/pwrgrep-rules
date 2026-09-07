# Fixture for gcp-gke-has-labels.
# ruleid: gcp-gke-has-labels
resource "google_container_cluster" "bad1" {
  name = "bad1"
}
# ruleid: gcp-gke-has-labels
resource "google_container_cluster" "bad2" {
  name = "bad2"
}
# ok: gcp-gke-has-labels
resource "google_container_cluster" "good1" {
resource_labels = {
    "good1-val" = "good1-val"
}
}
# ok: gcp-gke-has-labels
resource "google_container_cluster" "good2" {
resource_labels = {
    "good2-val" = "good2-val"
}
}
