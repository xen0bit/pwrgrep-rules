# Fixture for gcp-gke-monitoring-enabled.
# ruleid: gcp-gke-monitoring-enabled
resource "google_container_cluster" "bad1" {
  monitoring_service = "none"  
}
# ruleid: gcp-gke-monitoring-enabled
resource "google_container_cluster" "bad2" {
  monitoring_service = "none"  
}
# ok: gcp-gke-monitoring-enabled
resource "google_container_cluster" "good1" {
  name = "good1"
}
# ok: gcp-gke-monitoring-enabled
resource "google_container_cluster" "good2" {
  name = "good2"
}
