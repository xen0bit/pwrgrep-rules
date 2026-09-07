# Fixture for gcp-compute-template-public-ip.
# ruleid: gcp-compute-template-public-ip
resource "google_compute_instance_template" "bad1" {
network_interface {
  network = "default"
}
}
# ruleid: gcp-compute-template-public-ip
resource "google_compute_instance_template" "bad2" {
network_interface {
  network = "default"
}
}
# ok: gcp-compute-template-public-ip
resource "google_compute_instance_template" "good1" {
network_interface {
  network = "safe-fixed"
}
}
# ok: gcp-compute-template-public-ip
resource "google_compute_instance_template" "good2" {
  name = "good2"
}
