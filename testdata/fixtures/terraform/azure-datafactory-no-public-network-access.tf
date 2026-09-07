# Fixture for azure-datafactory-no-public-network-access.
# ruleid: azure-datafactory-no-public-network-access
resource "azurerm_data_factory" "bad1" {
  name = "bad1"
}
# ruleid: azure-datafactory-no-public-network-access
resource "azurerm_data_factory" "bad2" {
  name = "bad2"
}
# ok: azure-datafactory-no-public-network-access
resource "azurerm_data_factory" "good1" {
public_network_enabled = false
}
# ok: azure-datafactory-no-public-network-access
resource "azurerm_data_factory" "good2" {
public_network_enabled = false
}
