# Fixture for azure-redis-cache-enable-non-ssl-port.
# ruleid: azure-redis-cache-enable-non-ssl-port
resource "azurerm_redis_cache" "bad1" {
enable_non_ssl_port = true
}
# ruleid: azure-redis-cache-enable-non-ssl-port
resource "azurerm_redis_cache" "bad2" {
enable_non_ssl_port = true
}
# ok: azure-redis-cache-enable-non-ssl-port
resource "azurerm_redis_cache" "good1" {
enable_non_ssl_port = false
}
# ok: azure-redis-cache-enable-non-ssl-port
resource "azurerm_redis_cache" "good2" {
  name = "good2"
}
