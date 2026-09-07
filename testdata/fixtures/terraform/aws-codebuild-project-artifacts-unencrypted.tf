# Fixture for aws-codebuild-project-artifacts-unencrypted.
# ruleid: aws-codebuild-project-artifacts-unencrypted
resource "aws_codebuild_project" "bad1" {
  artifacts {
    encryption_disabled = true
  }
}
# ruleid: aws-codebuild-project-artifacts-unencrypted
resource "aws_codebuild_project" "bad2" {
  artifacts {
    encryption_disabled = true
  }
}
# ok: aws-codebuild-project-artifacts-unencrypted
resource "aws_codebuild_project" "good1" {
  artifacts {
    type = "NO_ARTIFACTS"
    encryption_disabled = true
  }
}
# ok: aws-codebuild-project-artifacts-unencrypted
resource "aws_codebuild_project" "good2" {
  artifacts {
    type = "NO_ARTIFACTS"
  }
}
