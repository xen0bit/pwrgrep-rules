# Fixture for gcp-folder-impersonation-roles-iam-binding.
# ruleid: gcp-folder-impersonation-roles-iam-binding
resource "google_folder_iam_binding" "bad1" {
role = "roles/editor"
members = [  ]
}
# ruleid: gcp-folder-impersonation-roles-iam-binding
resource "google_folder_iam_binding" "bad2" {
role = "roles/editor"
members = [  ]
}
# ok: gcp-folder-impersonation-roles-iam-binding
resource "google_folder_iam_binding" "good1" {
role = "safe-fixed"
members = [  ]
}
# ok: gcp-folder-impersonation-roles-iam-binding
resource "google_folder_iam_binding" "good2" {
  name = "good2"
}
