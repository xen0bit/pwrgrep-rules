# Fixture for azure-appservice-identity.
# ruleid: azure-appservice-identity
resource "azurerm_app_service" "bad1" {
  name = "bad1"
}
# ruleid: azure-appservice-identity
resource "azurerm_app_service" "bad2" {
  name = "bad2"
}
# ok: azure-appservice-identity
resource "azurerm_app_service" "good1" {
client_cert_enabled = true
identity {
}
}
# ok: azure-appservice-identity
resource "azurerm_app_service" "good2" {
client_cert_enabled = true
identity {
}
}
