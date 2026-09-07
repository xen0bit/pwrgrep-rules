# Fixture for aws-insecure-cloudfront-distribution-tls-version.
# ruleid: aws-insecure-cloudfront-distribution-tls-version
resource "aws_cloudfront_distribution" "bad1" {
  viewer_certificate {
  }
}
# ruleid: aws-insecure-cloudfront-distribution-tls-version
resource "aws_cloudfront_distribution" "bad2" {
  viewer_certificate {
  }
}
# ok: aws-insecure-cloudfront-distribution-tls-version
resource "aws_cloudfront_distribution" "good1" {
  viewer_certificate {
    minimum_protocol_version = "TLSv1.2_2018"
  }
}
# ok: aws-insecure-cloudfront-distribution-tls-version
resource "aws_cloudfront_distribution" "good2" {
  viewer_certificate {
    minimum_protocol_version = "TLSv1.2_2019"
  }
}
