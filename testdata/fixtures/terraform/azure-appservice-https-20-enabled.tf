# Fixture for azure-appservice-https-20-enabled.
# ruleid: azure-appservice-https-20-enabled
resource "azurerm_app_service" "bad1" {
  name = "bad1"
}
# ruleid: azure-appservice-https-20-enabled
resource "azurerm_app_service" "bad2" {
  name = "bad2"
}
# ok: azure-appservice-https-20-enabled
resource "azurerm_app_service" "good1" {
site_config {
  http2_enabled = true
}
}
# ok: azure-appservice-https-20-enabled
resource "azurerm_app_service" "good2" {
site_config {
  http2_enabled = true
}
}
