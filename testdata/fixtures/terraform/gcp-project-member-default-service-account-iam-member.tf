# gcp-project-member-default-service-account-iam-member: default compute service account as a member.
resource "google_project_iam_member" "bad" {
  project = "projects/123"
  role = "roles/editor"
  # ruleid: gcp-project-member-default-service-account-iam-member
  member = "serviceAccount:12345-compute@developer.gserviceaccount.com"
}

resource "google_project_iam_member" "bad2" {
  project = "projects/123"
  role = "roles/viewer"
  # ruleid: gcp-project-member-default-service-account-iam-member
  member = "serviceAccount:67890-compute@developer.gserviceaccount.com"
}

resource "google_project_iam_member" "good" {
  project = "projects/123"
  role = "roles/editor"
  # ok: gcp-project-member-default-service-account-iam-member
  member = "user:alice@example.com"
}

resource "google_project_iam_member" "plain" {
  project = "projects/123"
  # ok: gcp-project-member-default-service-account-iam-member
  role = "roles/viewer"
}
