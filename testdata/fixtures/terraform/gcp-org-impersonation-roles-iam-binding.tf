# Fixture for gcp-org-impersonation-roles-iam-binding.
# ruleid: gcp-org-impersonation-roles-iam-binding
resource "google_organization_iam_binding" "bad1" {
role = "roles/editor"
members = [  ]
}
# ruleid: gcp-org-impersonation-roles-iam-binding
resource "google_organization_iam_binding" "bad2" {
role = "roles/editor"
members = [  ]
}
# ok: gcp-org-impersonation-roles-iam-binding
resource "google_organization_iam_binding" "good1" {
role = "safe-fixed"
members = [  ]
}
# ok: gcp-org-impersonation-roles-iam-binding
resource "google_organization_iam_binding" "good2" {
  name = "good2"
}
