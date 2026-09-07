# Fixture for appservice-require-client-cert.
# ruleid: appservice-require-client-cert
resource "azurerm_app_service" "bad1" {
  name = "bad1"
}
# ruleid: appservice-require-client-cert
resource "azurerm_app_service" "bad2" {
  client_cert_enabled = false
}
# ok: appservice-require-client-cert
resource "azurerm_app_service" "good1" {
  client_cert_enabled = true
}
# ok: appservice-require-client-cert
resource "azurerm_app_service" "good2" {
  client_cert_enabled = true
}
