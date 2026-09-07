# gcp-project-member-default-service-account-iam-binding: default compute service account inside members.
resource "google_project_iam_binding" "bad" {
  project = "projects/123"
  role = "roles/editor"
  # ruleid: gcp-project-member-default-service-account-iam-binding
  members = ["serviceAccount:12345-compute@developer.gserviceaccount.com"]
}

resource "google_project_iam_binding" "bad2" {
  project = "projects/123"
  role = "roles/viewer"
  # ruleid: gcp-project-member-default-service-account-iam-binding
  members = ["user:alice@example.com", "serviceAccount:67890-compute@developer.gserviceaccount.com"]
}

resource "google_project_iam_binding" "good" {
  project = "projects/123"
  role = "roles/editor"
  # ok: gcp-project-member-default-service-account-iam-binding
  members = ["user:alice@example.com"]
}

resource "google_project_iam_binding" "plain" {
  project = "projects/123"
  # ok: gcp-project-member-default-service-account-iam-binding
  role = "roles/viewer"
}
