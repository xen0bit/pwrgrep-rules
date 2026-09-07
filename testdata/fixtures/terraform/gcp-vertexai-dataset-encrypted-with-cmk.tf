# Fixture for gcp-vertexai-dataset-encrypted-with-cmk.
# ruleid: gcp-vertexai-dataset-encrypted-with-cmk
resource "google_vertex_ai_dataset" "bad1" {
}
# ruleid: gcp-vertexai-dataset-encrypted-with-cmk
resource "google_vertex_ai_dataset" "bad2" {
}
# ok: gcp-vertexai-dataset-encrypted-with-cmk
resource "google_vertex_ai_dataset" "good1" {
  encryption_spec {
    kms_key_name = "good1-val"
  }
}
# ok: gcp-vertexai-dataset-encrypted-with-cmk
resource "google_vertex_ai_dataset" "good2" {
  encryption_spec {
    kms_key_name = "good2-val"
  }
}
