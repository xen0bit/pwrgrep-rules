# Fixture for azure-iot-no-public-network-access.
# ruleid: azure-iot-no-public-network-access
resource "azurerm_iothub" "bad1" {
public_network_access_enabled = true
}
# ruleid: azure-iot-no-public-network-access
resource "azurerm_iothub" "bad2" {
public_network_access_enabled = true
}
# ok: azure-iot-no-public-network-access
resource "azurerm_iothub" "good1" {
public_network_access_enabled = false
}
# ok: azure-iot-no-public-network-access
resource "azurerm_iothub" "good2" {
  name = "good2"
}
