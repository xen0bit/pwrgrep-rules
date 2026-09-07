# Fixture for azure-appservice-https-only.
# ruleid: azure-appservice-https-only
resource "azurerm_app_service" "bad1" {
  name = "bad1"
}
# ruleid: azure-appservice-https-only
resource "azurerm_app_service" "bad2" {
  name = "bad2"
}
# ok: azure-appservice-https-only
resource "azurerm_app_service" "good1" {
https_only = true
}
# ok: azure-appservice-https-only
resource "azurerm_app_service" "good2" {
https_only = true
}
