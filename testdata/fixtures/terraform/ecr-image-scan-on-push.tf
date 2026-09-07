# Fixture for ecr-image-scan-on-push.
# ruleid: ecr-image-scan-on-push
resource "aws_ecr_repository" "bad1" {
  name = "bad1"
}
# ruleid: ecr-image-scan-on-push
resource "aws_ecr_repository" "bad2" {
  name = "bad2"
}
# ok: ecr-image-scan-on-push
resource "aws_ecr_repository" "good1" {
  image_scanning_configuration {
    scan_on_push=true
  }
}
# ok: ecr-image-scan-on-push
resource "aws_ecr_repository" "good2" {
  image_scanning_configuration {
    scan_on_push=true
  }
}
