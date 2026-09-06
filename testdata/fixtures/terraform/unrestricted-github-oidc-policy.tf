# CWE-284: who, exactly, is allowed to assume this role.
#
# Naming token.actions.githubusercontent.com as a federated principal admits
# GitHub Actions. Only the condition on the `:sub` claim says whose Actions.

# ruleid: unrestricted-github-oidc-policy
data "aws_iam_policy_document" "wide_open" {
  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]
    principals {
      type        = "Federated"
      identifiers = ["arn:aws:iam::123456789012:oidc-provider/token.actions.githubusercontent.com"]
    }
  }
}

# ruleid: unrestricted-github-oidc-policy
data "aws_iam_policy_document" "audience_only" {
  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]
    principals {
      type        = "Federated"
      identifiers = ["arn:aws:iam::123456789012:oidc-provider/token.actions.githubusercontent.com"]
    }
    condition {
      test     = "StringEquals"
      variable = "token.actions.githubusercontent.com:aud"
      values   = ["sts.amazonaws.com"]
    }
  }
}

# ok: unrestricted-github-oidc-policy
data "aws_iam_policy_document" "pinned_to_a_repo" {
  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]
    principals {
      type        = "Federated"
      identifiers = ["arn:aws:iam::123456789012:oidc-provider/token.actions.githubusercontent.com"]
    }
    condition {
      test     = "StringEquals"
      variable = "token.actions.githubusercontent.com:sub"
      values   = ["repo:my-org/my-repo:ref:refs/heads/main"]
    }
  }
}

# ok: unrestricted-github-oidc-policy
data "aws_iam_policy_document" "not_github_at_all" {
  statement {
    actions   = ["s3:GetObject"]
    resources = ["arn:aws:s3:::my-bucket/*"]
  }
}
