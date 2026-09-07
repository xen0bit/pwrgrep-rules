# Fixture for azure-redis-cache-public-network-access-enabled.
# ruleid: azure-redis-cache-public-network-access-enabled
resource "azurerm_redis_cache" "bad1" {
  name = "bad1"
}
# ruleid: azure-redis-cache-public-network-access-enabled
resource "azurerm_redis_cache" "bad2" {
  name = "bad2"
}
# ok: azure-redis-cache-public-network-access-enabled
resource "azurerm_redis_cache" "good1" {
public_network_access_enabled = false
}
# ok: azure-redis-cache-public-network-access-enabled
resource "azurerm_redis_cache" "good2" {
public_network_access_enabled = false
}
