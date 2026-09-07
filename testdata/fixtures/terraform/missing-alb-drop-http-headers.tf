# Fixture for missing-alb-drop-http-headers.
# ruleid: missing-alb-drop-http-headers
resource "aws_lb" "bad1" {
}
# ruleid: missing-alb-drop-http-headers
resource "aws_alb" "bad2" {
}
# ok: missing-alb-drop-http-headers
resource "aws_lb" "good1" {
  drop_invalid_header_fields = true
}
# ok: missing-alb-drop-http-headers
resource "aws_alb" "good2" {
  drop_invalid_header_fields = true
}
