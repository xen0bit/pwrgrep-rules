# CWE-798: Provider with hard-coded credentials — secrets in source.
# Static access_key and secret_key in the provider block are checked
# into version control and visible to every reader. The rule flags
# provider "aws" with secret_key set; fix by using env vars or IAM roles.
provider "aws" {
  region     = "us-east-1"
  access_key = "AKIAIOSFODNN7EXAMPLE"
# ruleid: aws-provider-static-credentials
  secret_key = "wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY"
}
provider "aws" {
  alias      = "bad2"
  region     = "us-west-2"
  access_key = "AKIAIOSFODNN7EXAMPLE2"
# ruleid: aws-provider-static-credentials
  secret_key = "wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY2"
}
# ok: aws-provider-static-credentials
provider "aws" {
  region = "us-east-1"
}
# ok: aws-provider-static-credentials
provider "aws" {
  alias  = "good2"
  region = "us-east-1"
}
# ok: aws-provider-static-credentials
provider "aws" {
  alias  = "ok3"
  region = "eu-west-1"
}
