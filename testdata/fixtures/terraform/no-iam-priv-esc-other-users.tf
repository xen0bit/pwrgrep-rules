# Fixture for no-iam-priv-esc-other-users.
# The resource branch needs a non-first statement carrying a Resource value
# with a following statement, so it sits in the middle of three. Every
# Action line in such a block fires, so all three are marked.
resource "aws_iam_policy" "bad1" {
  name = "bad1"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow",
# ruleid: no-iam-priv-esc-other-users
        Action = "iam:ListUsers",
        Resource = "arn:aws:iam::123456789012:user/*"
      },
      {
        Effect = "Allow",
# ruleid: no-iam-priv-esc-other-users
        Action = "iam:CreateUser",
        Resource = "arn:aws:iam::123456789012:user/bad1"
      },
      {
        Effect = "Allow",
# ruleid: no-iam-priv-esc-other-users
        Action = "iam:DeleteUser",
        Resource = "arn:aws:iam::123456789012:user/bad1"
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
# ruleid: no-iam-priv-esc-other-users
        Action = "iam:ListUsers",
        Resource = "arn:aws:iam::123456789012:user/*"
      },
      {
        Effect = "Allow",
# ruleid: no-iam-priv-esc-other-users
        Action = "iam:AttachUserPolicy",
        Resource = "arn:aws:iam::123456789012:user/bad2"
      },
      {
        Effect = "Allow",
# ruleid: no-iam-priv-esc-other-users
        Action = "iam:DetachUserPolicy",
        Resource = "arn:aws:iam::123456789012:user/bad2"
      }
    ]
  })
  tags = "bad2"
}
# ok: no-iam-priv-esc-other-users
resource "aws_iam_policy" "good1" {
  name = "good1"
}
# ok: no-iam-priv-esc-other-users
resource "aws_iam_role" "good2" {
  name = "good2"
}
