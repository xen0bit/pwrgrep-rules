# Fixture for gcp-folder-impersonation-roles-iam-member.
# ruleid: gcp-folder-impersonation-roles-iam-member
resource "google_folder_iam_member" "bad1" {
role = "roles/editor"
member = "bad1-val"
}
# ruleid: gcp-folder-impersonation-roles-iam-member
resource "google_folder_iam_member" "bad2" {
role = "roles/editor"
member = "bad2-val"
}
# ok: gcp-folder-impersonation-roles-iam-member
resource "google_folder_iam_member" "good1" {
role = "safe-fixed"
member = "good1-val"
}
# ok: gcp-folder-impersonation-roles-iam-member
resource "google_folder_iam_member" "good2" {
  name = "good2"
}
