# Fixture for azure-functionapps-accessible-over-https.
# ruleid: azure-functionapps-accessible-over-https
resource "azurerm_app_service" "bad1" {
  name = "bad1"
}
# ruleid: azure-functionapps-accessible-over-https
resource "azurerm_app_service" "bad2" {
  name = "bad2"
}
# ok: azure-functionapps-accessible-over-https
resource "azurerm_app_service" "good1" {
https_only = true
}
# ok: azure-functionapps-accessible-over-https
resource "azurerm_app_service" "good2" {
https_only = true
}
