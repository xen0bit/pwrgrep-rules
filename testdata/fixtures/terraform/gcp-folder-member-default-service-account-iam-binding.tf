# gcp-folder-member-default-service-account-iam-binding: default compute service account inside members.
resource "google_folder_iam_binding" "bad" {
  folder = "folders/123"
  role = "roles/editor"
  # ruleid: gcp-folder-member-default-service-account-iam-binding
  members = ["serviceAccount:12345-compute@appspot.gserviceaccount.com"]
}

resource "google_folder_iam_binding" "bad2" {
  folder = "folders/123"
  role = "roles/viewer"
  # ruleid: gcp-folder-member-default-service-account-iam-binding
  members = ["user:alice@example.com", "serviceAccount:67890-compute@appspot.gserviceaccount.com"]
}

resource "google_folder_iam_binding" "good" {
  folder = "folders/123"
  role = "roles/editor"
  # ok: gcp-folder-member-default-service-account-iam-binding
  members = ["user:alice@example.com"]
}

resource "google_folder_iam_binding" "plain" {
  folder = "folders/123"
  # ok: gcp-folder-member-default-service-account-iam-binding
  role = "roles/viewer"
}
