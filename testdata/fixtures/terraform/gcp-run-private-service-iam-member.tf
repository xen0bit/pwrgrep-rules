# Fixture for gcp-run-private-service-iam-member.
# ruleid: gcp-run-private-service-iam-member
resource "google_cloud_run_service_iam_member" "bad1" {
member = "allAuthenticatedUsers"
}
# ruleid: gcp-run-private-service-iam-member
resource "google_cloud_run_service_iam_member" "bad2" {
member = "allUsers"
}
# ok: gcp-run-private-service-iam-member
resource "google_cloud_run_service_iam_member" "good1" {
member = "safe-fixed"
}
# ok: gcp-run-private-service-iam-member
resource "google_cloud_run_service_iam_member" "good2" {
  name = "good2"
}
