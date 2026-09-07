# Fixture for gcp-memory-store-for-redis-auth-enabled.
# ruleid: gcp-memory-store-for-redis-auth-enabled
resource "google_redis_instance" "bad1" {
  name = "bad1"
}
# ruleid: gcp-memory-store-for-redis-auth-enabled
resource "google_redis_instance" "bad2" {
  name = "bad2"
}
# ok: gcp-memory-store-for-redis-auth-enabled
resource "google_redis_instance" "good1" {
auth_enabled = true
}
# ok: gcp-memory-store-for-redis-auth-enabled
resource "google_redis_instance" "good2" {
auth_enabled = true
}
