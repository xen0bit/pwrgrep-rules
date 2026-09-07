# Fixture for gcp-datafusion-stack-driver-logging.
# ruleid: gcp-datafusion-stack-driver-logging
resource "google_data_fusion_instance" "bad1" {
  name = "bad1"
}
# ruleid: gcp-datafusion-stack-driver-logging
resource "google_data_fusion_instance" "bad2" {
  name = "bad2"
}
# ok: gcp-datafusion-stack-driver-logging
resource "google_data_fusion_instance" "good1" {
  enable_stackdriver_logging = true      
}
# ok: gcp-datafusion-stack-driver-logging
resource "google_data_fusion_instance" "good2" {
  enable_stackdriver_logging = true      
}
