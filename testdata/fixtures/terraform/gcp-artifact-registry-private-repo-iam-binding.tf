# Fixture for gcp-artifact-registry-private-repo-iam-binding.
# ruleid: gcp-artifact-registry-private-repo-iam-binding
resource "google_artifact_registry_repository_iam_binding" "bad1" {
members = [ "allAuthenticatedUsers"]
}
# ruleid: gcp-artifact-registry-private-repo-iam-binding
resource "google_artifact_registry_repository_iam_binding" "bad2" {
members = [ "allUsers"]
}
# ok: gcp-artifact-registry-private-repo-iam-binding
resource "google_artifact_registry_repository_iam_binding" "good1" {
members = [ "user:good@example.com"]
}
# ok: gcp-artifact-registry-private-repo-iam-binding
resource "google_artifact_registry_repository_iam_binding" "good2" {
  name = "good2"
}
