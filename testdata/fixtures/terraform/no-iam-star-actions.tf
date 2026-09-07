# Fixture for no-iam-star-actions.
# The finding lands on the Action line, so the annotation sits inside.
resource "aws_iam_policy" "bad1" {
  name = "bad1"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow",
# ruleid: no-iam-star-actions
        Action = "*",
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
# ruleid: no-iam-star-actions
        Action = ["*"],
        Resource = "*"
      }
    ]
  })
  tags = "bad2"
}
# ok: no-iam-star-actions
resource "aws_iam_policy" "good1" {
  name = "good1"
}
# ok: no-iam-star-actions
resource "aws_iam_role" "good2" {
  name = "good2"
}
