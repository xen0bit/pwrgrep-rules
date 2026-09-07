# Fixture for gcp-compute-project-os-login.
# ruleid: gcp-compute-project-os-login
resource "google_compute_project_metadata" "bad1" {
  name = "bad1"
}
# ruleid: gcp-compute-project-os-login
resource "google_compute_project_metadata" "bad2" {
  name = "bad2"
}
# ok: gcp-compute-project-os-login
resource "google_compute_project_metadata" "good1" {
metadata = {
    enable-oslogin = "True"
}
}
# ok: gcp-compute-project-os-login
resource "google_compute_project_metadata" "good2" {
metadata = {
    enable-oslogin = True
}
}
