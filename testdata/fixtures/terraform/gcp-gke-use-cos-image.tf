# Fixture for gcp-gke-use-cos-image.
# ruleid: gcp-gke-use-cos-image
resource "google_container_node_pool" "bad1" {
  name = "bad1"
}
# ruleid: gcp-gke-use-cos-image
resource "google_container_node_pool" "bad2" {
  name = "bad2"
}
# ok: gcp-gke-use-cos-image
resource "google_container_node_pool" "good1" {
node_config {
  image_type = "COS"
}
}
# ok: gcp-gke-use-cos-image
resource "google_container_node_pool" "good2" {
node_config {
  image_type = "COS"
}
}
