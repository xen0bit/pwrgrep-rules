# Fixture for no-iam-data-exfiltration.
# The resource branch needs a non-first statement carrying Resource = "*"
# with a following statement, so the wildcard sits in the middle of three.
# Every Action line in such a block fires, so all three are marked.
resource "aws_iam_policy" "bad1" {
  name = "bad1"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow",
# ruleid: no-iam-data-exfiltration
        Action = "s3:ListBucket",
        Resource = "arn:aws:s3:::bad1"
      },
      {
        Effect = "Allow",
# ruleid: no-iam-data-exfiltration
        Action = "s3:GetObject",
        Resource = "*"
      },
      {
        Effect = "Allow",
# ruleid: no-iam-data-exfiltration
        Action = "s3:PutObject",
        Resource = "arn:aws:s3:::bad1"
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
# ruleid: no-iam-data-exfiltration
        Action = "ec2:DescribeInstances",
        Resource = "arn:aws:ec2:us-east-1:123456789012:instance/*"
      },
      {
        Effect = "Allow",
# ruleid: no-iam-data-exfiltration
        Action = "ec2:StartInstances",
        Resource = "*"
      },
      {
        Effect = "Allow",
# ruleid: no-iam-data-exfiltration
        Action = "ec2:StopInstances",
        Resource = "arn:aws:ec2:us-east-1:123456789012:instance/*"
      }
    ]
  })
  tags = "bad2"
}
# ok: no-iam-data-exfiltration
resource "aws_iam_policy" "good1" {
  name = "good1"
}
# ok: no-iam-data-exfiltration
resource "aws_iam_role" "good2" {
  name = "good2"
}
