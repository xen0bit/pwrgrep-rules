# CWE-284: EC2 instance with public IP — directly reachable from internet.
# associate_public_ip_address = true exposes the instance; default is
# false. The rule flags instances with true; fix with false or omit the
# attribute (omission is secure, so no finding).
# ruleid: aws-ec2-has-public-ip
resource "aws_instance" "bad1" {
  ami                         = "ami-12345"
  instance_type               = "t2.micro"
  associate_public_ip_address = true
}
# ruleid: aws-ec2-has-public-ip
resource "aws_instance" "bad2" {
  ami                         = "ami-12345"
  instance_type               = "t2.micro"
  associate_public_ip_address = true
}
# ok: aws-ec2-has-public-ip
resource "aws_instance" "good1" {
  ami                         = "ami-12345"
  instance_type               = "t2.micro"
  associate_public_ip_address = false
}
# ok: aws-ec2-has-public-ip
resource "aws_instance" "good2" {
  ami           = "ami-12345"
  instance_type = "t2.micro"
}

# ok: aws-ec2-has-public-ip
resource "aws_instance" "ok3" {
  ami           = "ami-12345"
  instance_type = "t2.micro"
}
