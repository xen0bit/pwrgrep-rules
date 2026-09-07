# Fixture for no-iam-creds-exposure.
# The finding lands on the Action line, so the annotation sits inside.
resource "aws_iam_policy" "bad1" {
  name = "bad1"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow",
# ruleid: no-iam-creds-exposure
        Action = "iam:CreateAccessKey",
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
# ruleid: no-iam-creds-exposure
        Action = "iam:UpdateAccessKey",
        Resource = "*"
      }
    ]
  })
  tags = "bad2"
}
# ok: no-iam-creds-exposure
resource "aws_iam_policy" "good1" {
  name = "good1"
}
# ok: no-iam-creds-exposure
resource "aws_iam_role" "good2" {
  name = "good2"
}
