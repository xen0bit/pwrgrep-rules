# Fixture for gcp-run-private-service-iam-binding.
# ruleid: gcp-run-private-service-iam-binding
resource "google_cloud_run_service_iam_binding" "bad1" {
members = [ "allAuthenticatedUsers"]
}
# ruleid: gcp-run-private-service-iam-binding
resource "google_cloud_run_service_iam_binding" "bad2" {
members = [ "allUsers"]
}
# ok: gcp-run-private-service-iam-binding
resource "google_cloud_run_service_iam_binding" "good1" {
members = [ "user:good@example.com"]
}
# ok: gcp-run-private-service-iam-binding
resource "google_cloud_run_service_iam_binding" "good2" {
  name = "good2"
}
