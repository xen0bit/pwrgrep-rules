# Fixture for aws-ec2-security-group-rule-missing-description.
# ruleid: aws-ec2-security-group-rule-missing-description
resource "aws_security_group" "bad1" {
  name = "bad1"
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
# ruleid: aws-ec2-security-group-rule-missing-description
resource "aws_security_group_rule" "bad2" {
  type = "ingress"
  from_port = 443
  to_port = 443
  protocol = "tcp"
  security_group_id = "sg-bad2"
}
# ok: aws-ec2-security-group-rule-missing-description
resource "aws_security_group" "good1" {
  name = "good1"
  description = "web service"
  ingress {
    description = "web traffic"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
# ok: aws-ec2-security-group-rule-missing-description
resource "aws_security_group_rule" "good2" {
  type = "ingress"
  description = "web traffic"
  from_port = 443
  to_port = 443
  protocol = "tcp"
  security_group_id = "sg-good2"
}
