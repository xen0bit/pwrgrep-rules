# gcp-org-member-default-service-account-iam-binding: default compute service account inside members.
resource "google_organization_iam_binding" "bad" {
  organization = "organizations/123"
  role = "roles/editor"
  # ruleid: gcp-org-member-default-service-account-iam-binding
  members = ["serviceAccount:12345-compute@developer.gserviceaccount.com"]
}

resource "google_organization_iam_binding" "bad2" {
  organization = "organizations/123"
  role = "roles/viewer"
  # ruleid: gcp-org-member-default-service-account-iam-binding
  members = ["user:alice@example.com", "serviceAccount:67890-compute@developer.gserviceaccount.com"]
}

resource "google_organization_iam_binding" "good" {
  organization = "organizations/123"
  role = "roles/editor"
  # ok: gcp-org-member-default-service-account-iam-binding
  members = ["user:alice@example.com"]
}

resource "google_organization_iam_binding" "plain" {
  organization = "organizations/123"
  # ok: gcp-org-member-default-service-account-iam-binding
  role = "roles/viewer"
}
