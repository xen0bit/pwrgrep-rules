# Fixture for azure-networkinterface-enable-ip-forwarding.
# ruleid: azure-networkinterface-enable-ip-forwarding
resource "azurerm_network_interface" "bad1" {
enable_ip_forwarding = true
}
# ruleid: azure-networkinterface-enable-ip-forwarding
resource "azurerm_network_interface" "bad2" {
enable_ip_forwarding = true
}
# ok: azure-networkinterface-enable-ip-forwarding
resource "azurerm_network_interface" "good1" {
enable_ip_forwarding = false
}
# ok: azure-networkinterface-enable-ip-forwarding
resource "azurerm_network_interface" "good2" {
  name = "good2"
}
