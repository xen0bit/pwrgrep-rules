# Fixture for gcp-compute-shielded-vm.
# ruleid: gcp-compute-shielded-vm
resource "google_compute_instance" "bad1" {
  name = "bad1"
}
# ruleid: gcp-compute-shielded-vm
resource "google_compute_instance" "bad2" {
shielded_instance_config {
  enable_integrity_monitoring = false
}
}
# ok: gcp-compute-shielded-vm
resource "google_compute_instance" "good1" {
shielded_instance_config {
  enable_integrity_monitoring = true
}
}
# ok: gcp-compute-shielded-vm
resource "google_compute_instance" "good2" {
shielded_instance_config {
  enable_integrity_monitoring = true
}
}
