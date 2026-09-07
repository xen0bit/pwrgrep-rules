# Fixture for gcp-org-impersonation-roles-iam-member.
# ruleid: gcp-org-impersonation-roles-iam-member
resource "google_organization_iam_member" "bad1" {
role = "roles/editor"
member = "bad1-val"
}
# ruleid: gcp-org-impersonation-roles-iam-member
resource "google_organization_iam_member" "bad2" {
role = "roles/editor"
member = "bad2-val"
}
# ok: gcp-org-impersonation-roles-iam-member
resource "google_organization_iam_member" "good1" {
role = "safe-fixed"
member = "good1-val"
}
# ok: gcp-org-impersonation-roles-iam-member
resource "google_organization_iam_member" "good2" {
  name = "good2"
}
