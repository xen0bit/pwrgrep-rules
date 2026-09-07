# Fixture for aws-ecr-image-scanning-disabled.
# ruleid: aws-ecr-image-scanning-disabled
resource "aws_ecr_repository" "bad1" {
}
# ruleid: aws-ecr-image-scanning-disabled
resource "aws_ecr_repository" "bad2" {
}
# ok: aws-ecr-image-scanning-disabled
resource "aws_ecr_repository" "good1" {
  image_scanning_configuration {
    scan_on_push = true
  }
}
# ok: aws-ecr-image-scanning-disabled
resource "aws_ecr_repository" "good2" {
  image_scanning_configuration {
    scan_on_push = true
  }
}
