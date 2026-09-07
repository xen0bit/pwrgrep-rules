# Fixture for azure-functionapp-http-version-latest.
# ruleid: azure-functionapp-http-version-latest
resource "azurerm_function_app" "bad1" {
  name = "bad1"
}
# ruleid: azure-functionapp-http-version-latest
resource "azurerm_function_app" "bad2" {
  name = "bad2"
}
# ok: azure-functionapp-http-version-latest
resource "azurerm_function_app" "good1" {
site_config {
  http2_enabled = true
}
}
# ok: azure-functionapp-http-version-latest
resource "azurerm_function_app" "good2" {
site_config {
  http2_enabled = true
}
}
