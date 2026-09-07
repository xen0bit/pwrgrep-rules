# Fixture for eks-public-endpoint-enabled.
# ruleid: eks-public-endpoint-enabled
resource "aws_eks_cluster" "bad1" {
  name = "bad1"
}
# ruleid: eks-public-endpoint-enabled
resource "aws_eks_cluster" "bad2" {
  name = "bad2"
}
# ok: eks-public-endpoint-enabled
resource "aws_eks_cluster" "good1"{
  vpc_config{
    endpoint_public_access = false
  }
}
# ok: eks-public-endpoint-enabled
resource "aws_eks_cluster" "good2"{
  vpc_config{
    endpoint_public_access = false
  }
}
