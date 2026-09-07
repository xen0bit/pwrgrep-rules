# Fixture for azure-appservice-php-version.
# ruleid: azure-appservice-php-version
resource "azurerm_app_service" "bad1" {
  name = "bad1"
}
# ruleid: azure-appservice-php-version
resource "azurerm_app_service" "bad2" {
  name = "bad2"
}
# ok: azure-appservice-php-version
resource "azurerm_app_service" "good1" {
site_config {
  php_version = "7.4"
}
}
# ok: azure-appservice-php-version
resource "azurerm_app_service" "good2" {
site_config {
  php_version = "7.4"
}
}
