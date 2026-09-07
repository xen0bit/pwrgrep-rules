# Fixture for gcp-compute-template-shielded-vm.
# ruleid: gcp-compute-template-shielded-vm
resource "google_compute_instance_template" "bad1" {
shielded_instance_config {
  enable_integrity_monitoring = false
}
}
# ruleid: gcp-compute-template-shielded-vm
resource "google_compute_instance_template" "bad2" {
shielded_instance_config {
  enable_integrity_monitoring = false
}
}
# ok: gcp-compute-template-shielded-vm
resource "google_compute_instance_template" "good1" {
shielded_instance_config {
  enable_integrity_monitoring = true
}
}
# ok: gcp-compute-template-shielded-vm
resource "google_compute_instance_template" "good2" {
  name = "good2"
}
