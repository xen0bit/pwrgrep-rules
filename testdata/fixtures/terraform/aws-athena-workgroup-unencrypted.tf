# Fixture for aws-athena-workgroup-unencrypted.
# ruleid: aws-athena-workgroup-unencrypted
resource "aws_athena_workgroup" "bad1" {
  configuration {
    result_configuration {
    }
  }
}
# ruleid: aws-athena-workgroup-unencrypted
resource "aws_athena_workgroup" "bad2" {
  configuration {
    result_configuration {
    }
  }
}
# ok: aws-athena-workgroup-unencrypted
resource "aws_athena_workgroup" "good1" {
  configuration {
    result_configuration {
      encryption_configuration {
      }
    }
  }
}
# ok: aws-athena-workgroup-unencrypted
resource "aws_athena_workgroup" "good2" {
  configuration {
    result_configuration {
      encryption_configuration {
      }
    }
  }
}
