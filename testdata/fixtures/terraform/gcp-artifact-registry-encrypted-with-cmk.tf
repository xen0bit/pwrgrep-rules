# Fixture for gcp-artifact-registry-encrypted-with-cmk.
# ruleid: gcp-artifact-registry-encrypted-with-cmk
resource "google_artifact_registry_repository" "bad1" {
}
# ruleid: gcp-artifact-registry-encrypted-with-cmk
resource "google_artifact_registry_repository" "bad2" {
}
# ok: gcp-artifact-registry-encrypted-with-cmk
resource "google_artifact_registry_repository" "good1" {
  kms_key_name = "good1-val"
}
# ok: gcp-artifact-registry-encrypted-with-cmk
resource "google_artifact_registry_repository" "good2" {
  kms_key_name = "good2-val"
}
