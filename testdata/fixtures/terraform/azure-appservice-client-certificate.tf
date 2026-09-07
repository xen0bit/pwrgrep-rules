# Fixture for azure-appservice-client-certificate.
# ruleid: azure-appservice-client-certificate
resource "azurerm_app_service" "bad1" {
  name = "bad1"
}
# ruleid: azure-appservice-client-certificate
resource "azurerm_app_service" "bad2" {
  name = "bad2"
}
# ok: azure-appservice-client-certificate
resource "azurerm_app_service" "good1" {
client_cert_enabled = true
}
# ok: azure-appservice-client-certificate
resource "azurerm_app_service" "good2" {
client_cert_enabled = true
}
