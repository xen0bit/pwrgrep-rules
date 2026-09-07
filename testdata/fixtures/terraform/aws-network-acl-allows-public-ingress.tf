# Fixture for aws-network-acl-allows-public-ingress.
# ruleid: aws-network-acl-allows-public-ingress
resource "aws_network_acl_rule" "bad1" {
  network_acl_id = "acl-bad1"
  rule_number = 100
  protocol = "tcp"
  rule_action = "allow"
  cidr_block = "0.0.0.0/0"
}
# ruleid: aws-network-acl-allows-public-ingress
resource "aws_network_acl_rule" "bad2" {
  network_acl_id = "acl-bad2"
  rule_number = 100
  protocol = "tcp"
  rule_action = "allow"
  cidr_block = "0.0.0.0/0"
  egress = false
}
# The rule checks no CIDR value, only allow without egress, so the ok lines
# are an egress rule and a deny rule over the same public range.
# ok: aws-network-acl-allows-public-ingress
resource "aws_network_acl_rule" "good1" {
  network_acl_id = "acl-good1"
  rule_number = 100
  protocol = "tcp"
  rule_action = "allow"
  cidr_block = "0.0.0.0/0"
  egress = true
}
# ok: aws-network-acl-allows-public-ingress
resource "aws_network_acl_rule" "good2" {
  network_acl_id = "acl-good2"
  rule_number = 100
  protocol = "tcp"
  rule_action = "deny"
  cidr_block = "0.0.0.0/0"
}
