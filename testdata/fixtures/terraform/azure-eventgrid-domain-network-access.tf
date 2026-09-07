# Fixture for azure-eventgrid-domain-network-access.
# ruleid: azure-eventgrid-domain-network-access
resource "azurerm_eventgrid_domain" "bad1" {
  name = "bad1"
}
# ruleid: azure-eventgrid-domain-network-access
resource "azurerm_eventgrid_domain" "bad2" {
  name = "bad2"
}
# ok: azure-eventgrid-domain-network-access
resource "azurerm_eventgrid_domain" "good1" {
public_network_access_enabled = false
}
# ok: azure-eventgrid-domain-network-access
resource "azurerm_eventgrid_domain" "good2" {
public_network_access_enabled = false
}
