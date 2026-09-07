# Fixture for eks-insufficient-control-plane-logging.
# The finding lands on the name line, so the annotation sits inside.
resource "aws_eks_cluster" "bad1" {
# ruleid: eks-insufficient-control-plane-logging
  name = "bad1"
}
resource "aws_eks_cluster" "bad2" {
# ruleid: eks-insufficient-control-plane-logging
  name = "bad2"
}
# ok: eks-insufficient-control-plane-logging
resource "aws_eks_cluster" "good1" {
  name = "good1"
  enabled_cluster_log_types = ["api", "audit"]
}
# ok: eks-insufficient-control-plane-logging
resource "aws_instance" "good2" {
  ami = "ami-good2"
}
