# Fixture for gcp-gke-ensure-integrity-monitoring.
# ruleid: gcp-gke-ensure-integrity-monitoring
resource "google_container_cluster" "bad1" {
  node_config {
    shielded_instance_config {
      enable_integrity_monitoring = false
    }
  }     
}
# ruleid: gcp-gke-ensure-integrity-monitoring
resource "google_container_cluster" "bad2" {
  node_config {
    shielded_instance_config {
      enable_integrity_monitoring = false
    }
  }     
}
# ok: gcp-gke-ensure-integrity-monitoring
resource "google_container_cluster" "good1" {
  name = "good1"
}
# ok: gcp-gke-ensure-integrity-monitoring
resource "google_container_cluster" "good2" {
  name = "good2"
}
