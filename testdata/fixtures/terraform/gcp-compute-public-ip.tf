# Fixture for gcp-compute-public-ip.
# ruleid: gcp-compute-public-ip
resource "google_compute_instance" "bad1" {
network_interface {
  network = "default"
}
}
# ruleid: gcp-compute-public-ip
resource "google_compute_instance" "bad2" {
network_interface {
  network = "default"
}
}
# ok: gcp-compute-public-ip
resource "google_compute_instance" "good1" {
network_interface {
  network = "safe-fixed"
}
}
# ok: gcp-compute-public-ip
resource "google_compute_instance" "good2" {
  name = "good2"
}
