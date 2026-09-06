# CWE-732: a bucket granted to everybody.
#
# `google_storage_bucket_iam_member` takes one `member`; the `_binding` form
# takes a `members` list. Each is written the way Terraform accepts it.

# ruleid: gcp-bucket-public-iam
resource "google_storage_bucket_iam_member" "world_readable" {
  bucket = google_storage_bucket.example.name
  role   = "roles/storage.objectViewer"
  member = "allUsers"
}

# ruleid: gcp-bucket-public-iam
resource "google_storage_bucket_iam_member" "any_google_account" {
  bucket = "my-bucket"
  role   = "roles/storage.legacyBucketReader"
  member = "allAuthenticatedUsers"
}

# ruleid: gcp-bucket-public-iam
resource "google_storage_bucket_iam_binding" "world_readable_binding" {
  bucket  = google_storage_bucket.example.name
  role    = "roles/storage.objectViewer"
  members = ["allUsers", "user:alice@example.com"]
}

# ok: gcp-bucket-public-iam
resource "google_storage_bucket_iam_member" "one_person" {
  bucket = google_storage_bucket.example.name
  role   = "roles/storage.objectViewer"
  member = "user:alice@example.com"
}

# ok: gcp-bucket-public-iam
resource "google_storage_bucket_iam_member" "one_service_account" {
  bucket = "my-bucket-2"
  role   = "roles/storage.objectViewer"
  member = "serviceAccount:my-sa@project.iam.gserviceaccount.com"
}

# ok: gcp-bucket-public-iam
resource "google_storage_bucket_iam_binding" "a_named_group" {
  bucket  = google_storage_bucket.example.name
  role    = "roles/storage.objectViewer"
  members = ["group:eng@example.com", "user:bob@example.com"]
}
