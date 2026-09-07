# Fixture for azure-apiservices-use-virtualnetwork.
# ruleid: azure-apiservices-use-virtualnetwork
resource "azurerm_api_management" "bad1" {
  name = "bad1"
}
# ruleid: azure-apiservices-use-virtualnetwork
resource "azurerm_api_management" "bad2" {
  name = "bad2"
}
# ok: azure-apiservices-use-virtualnetwork
resource "azurerm_api_management" "good1" {
virtual_network_configuration {
  subnet_id = "good1-val"
}
}
# ok: azure-apiservices-use-virtualnetwork
resource "azurerm_api_management" "good2" {
virtual_network_configuration {
  subnet_id = "good2-val"
}
}
