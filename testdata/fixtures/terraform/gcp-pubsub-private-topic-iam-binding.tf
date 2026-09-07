# Fixture for gcp-pubsub-private-topic-iam-binding.
# ruleid: gcp-pubsub-private-topic-iam-binding
resource "google_pubsub_topic_iam_binding" "bad1" {
members = [ "allAuthenticatedUsers"]
}
# ruleid: gcp-pubsub-private-topic-iam-binding
resource "google_pubsub_topic_iam_binding" "bad2" {
members = [ "allUsers"]
}
# ok: gcp-pubsub-private-topic-iam-binding
resource "google_pubsub_topic_iam_binding" "good1" {
members = [ "user:good@example.com"]
}
# ok: gcp-pubsub-private-topic-iam-binding
resource "google_pubsub_topic_iam_binding" "good2" {
  name = "good2"
}
