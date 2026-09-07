# Fixture for aws-athena-client-can-disable-workgroup-encryption.
# ruleid: aws-athena-client-can-disable-workgroup-encryption
resource "aws_athena_workgroup" "bad1" {
  configuration {
    enforce_workgroup_configuration = false
    result_configuration {
      encryption_configuration {
      }
    }
  }
}
# ruleid: aws-athena-client-can-disable-workgroup-encryption
resource "aws_athena_workgroup" "bad2" {
  configuration {
    enforce_workgroup_configuration = false
    result_configuration {
      encryption_configuration {
      }
    }
  }
}
# ok: aws-athena-client-can-disable-workgroup-encryption
resource "aws_athena_workgroup" "good1" {
  configuration {
    enforce_workgroup_configuration = true
    result_configuration {
      encryption_configuration {
      }
    }
  }
}
# ok: aws-athena-client-can-disable-workgroup-encryption
resource "aws_athena_workgroup" "good2" {
  name = "good2"
}
