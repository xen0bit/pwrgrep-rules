# Fixture for no-iam-resource-exposure.
# The finding lands on the Action line, so the annotation sits inside.
resource "aws_iam_policy" "bad1" {
  name = "bad1"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow",
# ruleid: no-iam-resource-exposure
        Action = "s3:PutBucketPolicy",
        Resource = "*"
      }
    ]
  })
  tags = "bad1"
}
resource "aws_iam_policy" "bad2" {
  name = "bad2"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow",
# ruleid: no-iam-resource-exposure
        Action = "ec2:AuthorizeSecurityGroupIngress",
        Resource = "*"
      }
    ]
  })
  tags = "bad2"
}
# ok: no-iam-resource-exposure
resource "aws_iam_policy" "good1" {
  name = "good1"
}
# ok: no-iam-resource-exposure
resource "aws_iam_role" "good2" {
  name = "good2"
}
