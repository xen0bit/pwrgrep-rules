# Fixture for gcp-gke-nodepool-integrity-monitoring.
# ruleid: gcp-gke-nodepool-integrity-monitoring
resource "google_container_node_pool" "bad1" {
  node_config {
    shielded_instance_config {
      enable_integrity_monitoring = false
    }
  }     
}
# ruleid: gcp-gke-nodepool-integrity-monitoring
resource "google_container_node_pool" "bad2" {
  node_config {
    shielded_instance_config {
      enable_integrity_monitoring = false
    }
  }     
}
# ok: gcp-gke-nodepool-integrity-monitoring
resource "google_container_node_pool" "good1" {
  name = "good1"
}
# ok: gcp-gke-nodepool-integrity-monitoring
resource "google_container_node_pool" "good2" {
  name = "good2"
}
