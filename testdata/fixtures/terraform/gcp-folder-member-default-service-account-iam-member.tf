# gcp-folder-member-default-service-account-iam-member: default compute service account as a member.
resource "google_folder_iam_member" "bad" {
  folder = "folders/123"
  role = "roles/editor"
  # ruleid: gcp-folder-member-default-service-account-iam-member
  member = "serviceAccount:12345-compute@developer.gserviceaccount.com"
}

resource "google_folder_iam_member" "bad2" {
  folder = "folders/123"
  role = "roles/viewer"
  # ruleid: gcp-folder-member-default-service-account-iam-member
  member = "serviceAccount:67890-compute@developer.gserviceaccount.com"
}

resource "google_folder_iam_member" "good" {
  folder = "folders/123"
  role = "roles/editor"
  # ok: gcp-folder-member-default-service-account-iam-member
  member = "user:alice@example.com"
}

resource "google_folder_iam_member" "plain" {
  folder = "folders/123"
  # ok: gcp-folder-member-default-service-account-iam-member
  role = "roles/viewer"
}
