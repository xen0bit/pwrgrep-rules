# Fixture for azure-appservice-java-version.
# ruleid: azure-appservice-java-version
resource "azurerm_app_service" "bad1" {
  name = "bad1"
}
# ruleid: azure-appservice-java-version
resource "azurerm_app_service" "bad2" {
  name = "bad2"
}
# ok: azure-appservice-java-version
resource "azurerm_app_service" "good1" {
site_config {
  java_version = "11"
}
}
# ok: azure-appservice-java-version
resource "azurerm_app_service" "good2" {
site_config {
  java_version = "11"
}
}
