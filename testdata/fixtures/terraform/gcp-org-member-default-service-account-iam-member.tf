# gcp-org-member-default-service-account-iam-member: default compute service account as a member.
resource "google_organization_iam_member" "bad" {
  organization = "organizations/123"
  role = "roles/editor"
  # ruleid: gcp-org-member-default-service-account-iam-member
  member = "serviceAccount:12345-compute@developer.gserviceaccount.com"
}

resource "google_organization_iam_member" "bad2" {
  organization = "organizations/123"
  role = "roles/viewer"
  # ruleid: gcp-org-member-default-service-account-iam-member
  member = "serviceAccount:67890-compute@developer.gserviceaccount.com"
}

resource "google_organization_iam_member" "good" {
  organization = "organizations/123"
  role = "roles/editor"
  # ok: gcp-org-member-default-service-account-iam-member
  member = "user:alice@example.com"
}

resource "google_organization_iam_member" "plain" {
  organization = "organizations/123"
  # ok: gcp-org-member-default-service-account-iam-member
  role = "roles/viewer"
}
