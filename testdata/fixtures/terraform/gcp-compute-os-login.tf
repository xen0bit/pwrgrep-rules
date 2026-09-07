# Fixture for gcp-compute-os-login.
# ruleid: gcp-compute-os-login
resource "google_compute_instance" "bad1" {
metadata = {
    enable-oslogin = false
}
}
# ruleid: gcp-compute-os-login
resource "google_compute_instance" "bad2" {
metadata = {
    enable-oslogin = false
}
}
# ok: gcp-compute-os-login
resource "google_compute_instance" "good1" {
metadata = {
    enable-oslogin = true
}
}
# ok: gcp-compute-os-login
resource "google_compute_instance" "good2" {
  name = "good2"
}
