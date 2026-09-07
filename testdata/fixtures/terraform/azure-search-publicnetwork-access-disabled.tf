# Fixture for azure-search-publicnetwork-access-disabled.
# ruleid: azure-search-publicnetwork-access-disabled
resource "azurerm_search_service" "bad1" {
  name = "bad1"
}
# ruleid: azure-search-publicnetwork-access-disabled
resource "azurerm_search_service" "bad2" {
  name = "bad2"
}
# ok: azure-search-publicnetwork-access-disabled
resource "azurerm_search_service" "good1" {
public_network_access_enabled = false
}
# ok: azure-search-publicnetwork-access-disabled
resource "azurerm_search_service" "good2" {
public_network_access_enabled = false
}
