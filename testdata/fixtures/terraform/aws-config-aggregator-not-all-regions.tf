# Fixture for aws-config-aggregator-not-all-regions.
# ruleid: aws-config-aggregator-not-all-regions
resource "aws_config_configuration_aggregator" "bad1" {
  account_aggregation_source {
    regions = ["us-east-1"]
  }
}
# ruleid: aws-config-aggregator-not-all-regions
resource "aws_config_configuration_aggregator" "bad2" {
  organization_aggregation_source {
    regions = ["us-west-2"]
  }
}
# ok: aws-config-aggregator-not-all-regions
resource "aws_config_configuration_aggregator" "good1" {
  name = "good1"
}
# ok: aws-config-aggregator-not-all-regions
resource "aws_config_configuration_aggregator" "good2" {
  name = "good2"
}
