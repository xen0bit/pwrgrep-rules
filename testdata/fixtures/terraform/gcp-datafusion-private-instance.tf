# Fixture for gcp-datafusion-private-instance.
# ruleid: gcp-datafusion-private-instance
resource "google_data_fusion_instance" "bad1" {
  name = "bad1"
}
# ruleid: gcp-datafusion-private-instance
resource "google_data_fusion_instance" "bad2" {
  name = "bad2"
}
# ok: gcp-datafusion-private-instance
resource "google_data_fusion_instance" "good1" {
private_instance = true
}
# ok: gcp-datafusion-private-instance
resource "google_data_fusion_instance" "good2" {
private_instance = true
}
