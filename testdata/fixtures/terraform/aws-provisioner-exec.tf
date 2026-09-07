# Fixture for aws-provisioner-exec.
resource "aws_instance" "bad1" {
# ruleid: aws-provisioner-exec
  provisioner "remote-exec" {
  }
}
resource "aws_instance" "bad2" {
# ruleid: aws-provisioner-exec
  provisioner "local-exec" {
  }
}
# ok: aws-provisioner-exec
resource "aws_instance" "good1" {
  name = "good1"
}
# ok: aws-provisioner-exec
resource "aws_instance" "good2" {
  name = "good2"
}
