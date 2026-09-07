# Fixture for no-iam-admin-privileges.
# The finding lands on the resource line. One bad block only: the
# resource+jsonencode pattern spans forward across same-shape blocks, so a
# second bad block would be swallowed into the first match.
# ruleid: no-iam-admin-privileges
resource "aws_iam_policy" "bad1" {
  name = "bad1"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow",
        Action = "s3:GetObject",
        Resource = "*"
      }
    ]
  })
  tags = "bad1"
}
# ok: no-iam-admin-privileges
resource "aws_iam_policy" "good1" {
  name = "good1"
}
# ok: no-iam-admin-privileges
resource "aws_iam_role" "good2" {
  name = "good2"
}
