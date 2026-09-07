# Fixture for gcp-project-service-account-user-iam-member.
# ruleid: gcp-project-service-account-user-iam-member
resource "google_project_iam_member" "bad1" {
role = "roles/iam.serviceAccountTokenCreator"
}
# ruleid: gcp-project-service-account-user-iam-member
resource "google_project_iam_member" "bad2" {
role = "roles/iam.serviceAccountUser"
}
# ok: gcp-project-service-account-user-iam-member
resource "google_project_iam_member" "good1" {
role = "safe-fixed"
}
# ok: gcp-project-service-account-user-iam-member
resource "google_project_iam_member" "good2" {
  name = "good2"
}
