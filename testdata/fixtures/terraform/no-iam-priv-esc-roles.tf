# Fixture for no-iam-priv-esc-roles.
# The finding lands on the Action line, so the annotation sits inside.
resource "aws_iam_policy" "bad1" {
  name = "bad1"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow",
# ruleid: no-iam-priv-esc-roles
        Action = "iam:PassRole",
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
# ruleid: no-iam-priv-esc-roles
        Action = "sts:AssumeRole",
        Resource = "*"
      }
    ]
  })
  tags = "bad2"
}
# ok: no-iam-priv-esc-roles
resource "aws_iam_policy" "good1" {
  name = "good1"
}
# ok: no-iam-priv-esc-roles
resource "aws_iam_role" "good2" {
  name = "good2"
}
