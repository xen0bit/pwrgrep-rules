# Fixture for azure-appservice-ftps-state.
# ruleid: azure-appservice-ftps-state
resource "azurerm_app_service" "bad1" {
  name = "bad1"
}
# ruleid: azure-appservice-ftps-state
resource "azurerm_app_service" "bad2" {
  name = "bad2"
}
# ok: azure-appservice-ftps-state
resource "azurerm_app_service" "good1" {
site_config {
  ftps_state = "FtpsOnly"
}
}
# ok: azure-appservice-ftps-state
resource "azurerm_app_service" "good2" {
site_config {
  ftps_state = "Disabled"
}
}
