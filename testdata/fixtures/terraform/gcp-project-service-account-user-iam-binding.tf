# Fixture for gcp-project-service-account-user-iam-binding.
# ruleid: gcp-project-service-account-user-iam-binding
resource "google_project_iam_binding" "bad1" {
role = "roles/iam.serviceAccountTokenCreator"
}
# ruleid: gcp-project-service-account-user-iam-binding
resource "google_project_iam_binding" "bad2" {
role = "roles/iam.serviceAccountUser"
}
# ok: gcp-project-service-account-user-iam-binding
resource "google_project_iam_binding" "good1" {
role = "safe-fixed"
}
# ok: gcp-project-service-account-user-iam-binding
resource "google_project_iam_binding" "good2" {
  name = "good2"
}
