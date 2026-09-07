# Fixture for azure-appservice-used-azure-files.
# ruleid: azure-appservice-used-azure-files
resource "azurerm_app_service" "bad1" {
  name = "bad1"
}
# ruleid: azure-appservice-used-azure-files
resource "azurerm_app_service" "bad2" {
  name = "bad2"
}
# ok: azure-appservice-used-azure-files
resource "azurerm_app_service" "good1" {
storage_account {
  type = "AzureFiles"
}
}
# ok: azure-appservice-used-azure-files
resource "azurerm_app_service" "good2" {
storage_account {
  type = "AzureFiles"
}
}
