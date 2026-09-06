# CWE-311: WorkSpaces root volume unencrypted.
# Without root_volume_encryption_enabled = true the root volume is
# unencrypted. The rule flags workspaces that omit it; fix by enabling
# the flag.
# ruleid: aws-workspaces-root-volume-unencrypted
resource "aws_workspaces_workspace" "bad1" {
  directory_id = "d-12345"
  bundle_id    = "wsb-12345"
  user_name    = "user1"
}
# ruleid: aws-workspaces-root-volume-unencrypted
resource "aws_workspaces_workspace" "bad2" {
  directory_id = "d-12345"
  bundle_id    = "wsb-12345"
  user_name    = "user2"
}
# ok: aws-workspaces-root-volume-unencrypted
resource "aws_workspaces_workspace" "good1" {
  directory_id                   = "d-12345"
  bundle_id                      = "wsb-12345"
  user_name                      = "user3"
  root_volume_encryption_enabled = true
}
# ok: aws-workspaces-root-volume-unencrypted
resource "aws_workspaces_workspace" "good2" {
  directory_id                   = "d-12345"
  bundle_id                      = "wsb-12345"
  user_name                      = "user4"
  root_volume_encryption_enabled = true
}

# ok: aws-workspaces-root-volume-unencrypted
resource "aws_workspaces_workspace" "ok3" {
  directory_id = "d-1234567890"
  bundle_id    = "wsb-12345"
  user_name    = "ok3"
  root_volume_encryption_enabled = true
}
