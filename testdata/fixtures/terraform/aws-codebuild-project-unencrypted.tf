# Fixture for aws-codebuild-project-unencrypted.
# ruleid: aws-codebuild-project-unencrypted
resource "aws_codebuild_project" "bad1" {
}
# ruleid: aws-codebuild-project-unencrypted
resource "aws_codebuild_project" "bad2" {
}
# ok: aws-codebuild-project-unencrypted
resource "aws_codebuild_project" "good1" {
  encryption_key = "good1-val"
}
# ok: aws-codebuild-project-unencrypted
resource "aws_codebuild_project" "good2" {
  encryption_key = "good2-val"
}
