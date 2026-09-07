# Fixture for gcp-pubsub-encrypted-with-cmk.
# ruleid: gcp-pubsub-encrypted-with-cmk
resource "google_pubsub_topic" "bad1" {
}
# ruleid: gcp-pubsub-encrypted-with-cmk
resource "google_pubsub_topic" "bad2" {
}
# ok: gcp-pubsub-encrypted-with-cmk
resource "google_pubsub_topic" "good1" {
  kms_key_name = "good1-val"
}
# ok: gcp-pubsub-encrypted-with-cmk
resource "google_pubsub_topic" "good2" {
  kms_key_name = "good2-val"
}
