# CWE-284: Security group allows public ingress — open to internet.
resource "aws_security_group" "bad1" {
  name = "bad1"
# ruleid: aws-ec2-security-group-allows-public-ingress
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
# ruleid: aws-ec2-security-group-allows-public-ingress
resource "aws_security_group_rule" "bad2" {
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.bad1.id
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
}
# ruleid: aws-ec2-security-group-allows-public-ingress
resource "aws_vpc_security_group_ingress_rule" "bad3" {
  security_group_id = aws_security_group.bad1.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "tcp"
  from_port         = 443
  to_port           = 443
}
# ok: aws-ec2-security-group-allows-public-ingress
resource "aws_security_group" "good1" {
  name = "good1"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
# ok: aws-ec2-security-group-allows-public-ingress
resource "aws_security_group" "good2" {
  name = "good2"
}
# ok: aws-ec2-security-group-allows-public-ingress
resource "aws_security_group" "ok3" {
  name = "ok3"
  egress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
