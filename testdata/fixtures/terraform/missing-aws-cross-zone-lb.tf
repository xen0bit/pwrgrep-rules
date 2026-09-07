# Fixture for missing-aws-cross-zone-lb.
# ruleid: missing-aws-cross-zone-lb
resource "aws_lb" "bad1" {
  load_balancer_type = "bad1-val"
}
# ruleid: missing-aws-cross-zone-lb
resource "aws_alb" "bad2" {
  load_balancer_type = "bad2-val"
}
# ok: missing-aws-cross-zone-lb
resource "aws_lb" "good1" {
  enable_cross_zone_load_balancing = true
}
# ok: missing-aws-cross-zone-lb
resource "aws_alb" "good2" {
  load_balancer_type = "application"
}
