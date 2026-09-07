# Fixture for azure-appservice-python-version.
# ruleid: azure-appservice-python-version
resource "azurerm_app_service" "bad1" {
  name = "bad1"
}
# ruleid: azure-appservice-python-version
resource "azurerm_app_service" "bad2" {
  name = "bad2"
}
# ok: azure-appservice-python-version
resource "azurerm_app_service" "good1" {
site_config {
  python_version = "3.10"
}
}
# ok: azure-appservice-python-version
resource "azurerm_app_service" "good2" {
site_config {
  python_version = "3.10"
}
}
