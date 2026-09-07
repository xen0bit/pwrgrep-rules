# Fixture for aws-insecure-redshift-ssl-configuration.
# ruleid: aws-insecure-redshift-ssl-configuration
resource "aws_redshift_parameter_group" "bad1" {
}
# ruleid: aws-insecure-redshift-ssl-configuration
resource "aws_redshift_parameter_group" "bad2" {
}
# ok: aws-insecure-redshift-ssl-configuration
resource "aws_redshift_parameter_group" "good1" {
  parameter {
    name  = "require_ssl"
    value = "true"
  }
}
# ok: aws-insecure-redshift-ssl-configuration
resource "aws_redshift_parameter_group" "good2" {
  parameter {
    name  = "require_ssl"
    value = true
  }
}
