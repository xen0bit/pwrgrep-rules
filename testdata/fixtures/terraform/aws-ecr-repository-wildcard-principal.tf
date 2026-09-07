# Fixture for aws-ecr-repository-wildcard-principal.
# Only the quoted policy= branch can fire: the jsonencode branch matches from
# an earlier brace, so it never sits within the policy value. Values below
# are single tokens, the only shape that branch reads.
resource "aws_ecr_repository_policy" "bad1" {
  repository = "bad1"
# ruleid: aws-ecr-repository-wildcard-principal
  policy = "allow-star"
}
resource "aws_ecr_repository_policy" "bad2" {
  repository = "bad2"
# ruleid: aws-ecr-repository-wildcard-principal
  policy = "allow-star"
}
# ok: aws-ecr-repository-wildcard-principal
resource "aws_ecr_repository_policy" "good1" {
  repository = "good1"
}
# ok: aws-ecr-repository-wildcard-principal
resource "aws_ecr_repository" "good2" {
  name = "good2"
}
