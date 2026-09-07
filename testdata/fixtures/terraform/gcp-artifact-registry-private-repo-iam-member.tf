# Fixture for gcp-artifact-registry-private-repo-iam-member.
# ruleid: gcp-artifact-registry-private-repo-iam-member
resource "google_artifact_registry_repository_iam_member" "bad1" {
member = "allUsers"
}
# ruleid: gcp-artifact-registry-private-repo-iam-member
resource "google_artifact_registry_repository_iam_member" "bad2" {
member = "allAuthenticatedUsers"
}
# ok: gcp-artifact-registry-private-repo-iam-member
resource "google_artifact_registry_repository_iam_member" "good1" {
member = "safe-fixed"
}
# ok: gcp-artifact-registry-private-repo-iam-member
resource "google_artifact_registry_repository_iam_member" "good2" {
  name = "good2"
}
