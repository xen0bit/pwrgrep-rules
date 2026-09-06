# CWE-284: Subnet auto-assigns public IPs.
# map_public_ip_on_launch = true gives every instance a public IP.
# For aws_subnet omission is secure (no auto-assign); for
# aws_default_subnet omission is insecure and flagged. Fix with false.
# ruleid: aws-subnet-has-public-ip-address
resource "aws_subnet" "bad1" {
  vpc_id                  = "vpc-12345"
  cidr_block              = "10.0.0.0/24"
  map_public_ip_on_launch = true
}
# ruleid: aws-subnet-has-public-ip-address
resource "aws_subnet" "bad2" {
  vpc_id                  = "vpc-12345"
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
}
# ok: aws-subnet-has-public-ip-address
resource "aws_subnet" "good1" {
  vpc_id                  = "vpc-12345"
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = false
}
# ok: aws-subnet-has-public-ip-address
resource "aws_subnet" "good2" {
  vpc_id     = "vpc-12345"
  cidr_block = "10.0.3.0/24"
}

# ok: aws-subnet-has-public-ip-address
resource "aws_subnet" "ok3" {
  vpc_id     = "vpc-12345"
  cidr_block = "10.0.1.0/24"
}
# ok: aws-subnet-has-public-ip-address
resource "aws_default_subnet" "ok3" {
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = false
}
