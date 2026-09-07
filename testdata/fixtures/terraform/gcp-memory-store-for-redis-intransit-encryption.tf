# Fixture for gcp-memory-store-for-redis-intransit-encryption.
# ruleid: gcp-memory-store-for-redis-intransit-encryption
resource "google_redis_instance" "bad1" {
}
# ruleid: gcp-memory-store-for-redis-intransit-encryption
resource "google_redis_instance" "bad2" {
}
# ok: gcp-memory-store-for-redis-intransit-encryption
resource "google_redis_instance" "good1" {
  transit_encryption_mode = "SERVER_AUTHENTICATION"
}
# ok: gcp-memory-store-for-redis-intransit-encryption
resource "google_redis_instance" "good2" {
  transit_encryption_mode = "SERVER_AUTHENTICATION"
}
