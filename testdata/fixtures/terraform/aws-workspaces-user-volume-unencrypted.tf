# Fixture for aws-workspaces-user-volume-unencrypted.
# ruleid: aws-workspaces-user-volume-unencrypted
resource "aws_workspaces_workspace" "bad1" {
}
# ruleid: aws-workspaces-user-volume-unencrypted
resource "aws_workspaces_workspace" "bad2" {
}
# ok: aws-workspaces-user-volume-unencrypted
resource "aws_workspaces_workspace" "good1" {
  user_volume_encryption_enabled = true
}
# ok: aws-workspaces-user-volume-unencrypted
resource "aws_workspaces_workspace" "good2" {
  user_volume_encryption_enabled = true
}
