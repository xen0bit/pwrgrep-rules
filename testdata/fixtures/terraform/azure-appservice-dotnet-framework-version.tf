# Fixture for azure-appservice-dotnet-framework-version.
# ruleid: azure-appservice-dotnet-framework-version
resource "azurerm_app_service" "bad1" {
  name = "bad1"
}
# ruleid: azure-appservice-dotnet-framework-version
resource "azurerm_app_service" "bad2" {
  name = "bad2"
}
# ok: azure-appservice-dotnet-framework-version
resource "azurerm_app_service" "good1" {
site_config {
  dotnet_framework_version = "v6.0"
}
}
# ok: azure-appservice-dotnet-framework-version
resource "azurerm_app_service" "good2" {
site_config {
  dotnet_framework_version = "v6.0"
}
}
