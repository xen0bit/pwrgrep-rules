# Fixture for gcp-vertexai-metadata-store-encrypted-with-cmk.
# ruleid: gcp-vertexai-metadata-store-encrypted-with-cmk
resource "google_vertex_ai_metadata_store" "bad1" {
}
# ruleid: gcp-vertexai-metadata-store-encrypted-with-cmk
resource "google_vertex_ai_metadata_store" "bad2" {
}
# ok: gcp-vertexai-metadata-store-encrypted-with-cmk
resource "google_vertex_ai_metadata_store" "good1" {
  encryption_spec {
    kms_key_name = "good1-val"
  }
}
# ok: gcp-vertexai-metadata-store-encrypted-with-cmk
resource "google_vertex_ai_metadata_store" "good2" {
  encryption_spec {
    kms_key_name = "good2-val"
  }
}
