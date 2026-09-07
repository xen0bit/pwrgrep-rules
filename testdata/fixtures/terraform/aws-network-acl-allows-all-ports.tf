# Fixture for aws-network-acl-allows-all-ports.
# ruleid: aws-network-acl-allows-all-ports
resource "aws_network_acl_rule" "bad1" {
  network_acl_id = "acl-bad1"
  rule_number = 100
  protocol = "all"
  rule_action = "allow"
  cidr_block = "0.0.0.0/0"
}
# ruleid: aws-network-acl-allows-all-ports
resource "aws_network_acl_rule" "bad2" {
  network_acl_id = "acl-bad2"
  rule_number = 100
  protocol = "-1"
  rule_action = "allow"
  cidr_block = "10.0.0.0/8"
}
# ok: aws-network-acl-allows-all-ports
resource "aws_network_acl_rule" "good1" {
  network_acl_id = "acl-good1"
  rule_number = 100
  protocol = "tcp"
  rule_action = "allow"
  cidr_block = "10.0.0.0/8"
}
# ok: aws-network-acl-allows-all-ports
resource "aws_network_acl_rule" "good2" {
  network_acl_id = "acl-good2"
  rule_number = 100
  protocol = "all"
  rule_action = "deny"
  cidr_block = "0.0.0.0/0"
}
