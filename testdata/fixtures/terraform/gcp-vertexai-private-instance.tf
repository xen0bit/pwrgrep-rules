# Fixture for gcp-vertexai-private-instance.
# ruleid: gcp-vertexai-private-instance
resource "google_notebooks_instance" "bad1" {
  name = "bad1"
}
# ruleid: gcp-vertexai-private-instance
resource "google_notebooks_instance" "bad2" {
  name = "bad2"
}
# ok: gcp-vertexai-private-instance
resource "google_notebooks_instance" "good1" {
no_public_ip = true
}
# ok: gcp-vertexai-private-instance
resource "google_notebooks_instance" "good2" {
no_public_ip = true
}
