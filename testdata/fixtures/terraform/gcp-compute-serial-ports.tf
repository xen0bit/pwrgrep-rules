# Fixture for gcp-compute-serial-ports.
# ruleid: gcp-compute-serial-ports
resource "google_compute_instance" "bad1" {
metadata = {
    serial-port-enable = true
}
}
# ruleid: gcp-compute-serial-ports
resource "google_compute_instance" "bad2" {
metadata = {
    serial-port-enable = true
}
}
# ok: gcp-compute-serial-ports
resource "google_compute_instance" "good1" {
metadata = {
    serial-port-enable = false
}
}
# ok: gcp-compute-serial-ports
resource "google_compute_instance" "good2" {
  name = "good2"
}
