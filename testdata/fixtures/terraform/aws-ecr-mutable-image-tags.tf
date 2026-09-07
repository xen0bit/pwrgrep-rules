# Fixture for aws-ecr-mutable-image-tags.
# ruleid: aws-ecr-mutable-image-tags
resource "aws_ecr_repository" "bad1" {
}
# ruleid: aws-ecr-mutable-image-tags
resource "aws_ecr_repository" "bad2" {
}
# ok: aws-ecr-mutable-image-tags
resource "aws_ecr_repository" "good1" {
  image_tag_mutability = "IMMUTABLE"
}
# ok: aws-ecr-mutable-image-tags
resource "aws_ecr_repository" "good2" {
  image_tag_mutability = "IMMUTABLE"
}
