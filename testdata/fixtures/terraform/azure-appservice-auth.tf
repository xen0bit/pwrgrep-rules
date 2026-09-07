# Fixture for azure-appservice-auth.
# ruleid: azure-appservice-auth
resource "azurerm_app_service" "bad1" {
  name = "bad1"
}
# ruleid: azure-appservice-auth
resource "azurerm_app_service" "bad2" {
  name = "bad2"
}
# ok: azure-appservice-auth
resource "azurerm_app_service" "good1" {
auth_settings {
  enabled = true
}
}
# ok: azure-appservice-auth
resource "azurerm_app_service" "good2" {
auth_settings {
  enabled = true
}
}
