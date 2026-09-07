# Fixture for azure-appservice-identityprovider-enabled.
# ruleid: azure-appservice-identityprovider-enabled
resource "azurerm_app_service" "bad1" {
  name = "bad1"
}
# ruleid: azure-appservice-identityprovider-enabled
resource "azurerm_app_service" "bad2" {
  name = "bad2"
}
# ok: azure-appservice-identityprovider-enabled
resource "azurerm_app_service" "good1" {
identity {
type = "SystemAssigned"
}
}
# ok: azure-appservice-identityprovider-enabled
resource "azurerm_app_service" "good2" {
identity {
type = "SystemAssigned"
}
}
