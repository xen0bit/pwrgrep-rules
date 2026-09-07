# Fixture for azure-cognitiveservices-disables-public-network.
# ruleid: azure-cognitiveservices-disables-public-network
resource "azurerm_cognitive_account" "bad1" {
  name = "bad1"
}
# ruleid: azure-cognitiveservices-disables-public-network
resource "azurerm_cognitive_account" "bad2" {
  name = "bad2"
}
# ok: azure-cognitiveservices-disables-public-network
resource "azurerm_cognitive_account" "good1" {
public_network_access_enabled = false
}
# ok: azure-cognitiveservices-disables-public-network
resource "azurerm_cognitive_account" "good2" {
public_network_access_enabled = false
}
