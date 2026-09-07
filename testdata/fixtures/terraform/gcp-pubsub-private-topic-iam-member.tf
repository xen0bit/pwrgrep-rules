# Fixture for gcp-pubsub-private-topic-iam-member.
# ruleid: gcp-pubsub-private-topic-iam-member
resource "google_pubsub_topic_iam_member" "bad1" {
member = "allUsers"
}
# ruleid: gcp-pubsub-private-topic-iam-member
resource "google_pubsub_topic_iam_member" "bad2" {
member = "allAuthenticatedUsers"
}
# ok: gcp-pubsub-private-topic-iam-member
resource "google_pubsub_topic_iam_member" "good1" {
member = "safe-fixed"
}
# ok: gcp-pubsub-private-topic-iam-member
resource "google_pubsub_topic_iam_member" "good2" {
  name = "good2"
}
