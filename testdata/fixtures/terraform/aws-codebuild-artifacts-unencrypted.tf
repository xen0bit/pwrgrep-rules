# Fixture for aws-codebuild-artifacts-unencrypted.
resource "aws_codebuild_project" "bad1" {
  name = "bad1"
# ruleid: aws-codebuild-artifacts-unencrypted
  artifacts {
    type = "S3"
    encryption_disabled = true
  }
}
resource "aws_codebuild_project" "bad2" {
  name = "bad2"
# ruleid: aws-codebuild-artifacts-unencrypted
  secondary_artifacts {
    type = "CODEPIPELINE"
    encryption_disabled = true
  }
}
# ok: aws-codebuild-artifacts-unencrypted
resource "aws_codebuild_project" "good1" {
  name = "good1"
  artifacts {
    type = "S3"
    encryption_disabled = false
  }
}
# ok: aws-codebuild-artifacts-unencrypted
resource "aws_codebuild_project" "good2" {
  name = "good2"
}
