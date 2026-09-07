# Fixture for appservice-enable-https-only.
# ruleid: appservice-enable-https-only
resource "azurerm_app_service" "bad1" {
  name = "bad1"
}
# ruleid: appservice-enable-https-only
resource "azurerm_app_service" "bad2" {
  https_only = false
}
# ok: appservice-enable-https-only
resource "azurerm_app_service" "good1" {
  https_only = true
}
# ok: appservice-enable-https-only
resource "azurerm_app_service" "good2" {
  https_only = true
}
