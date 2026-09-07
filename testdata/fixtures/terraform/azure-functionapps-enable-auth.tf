# Fixture for azure-functionapps-enable-auth.
# ruleid: azure-functionapps-enable-auth
resource "azurerm_function_app" "bad1" {
  name = "bad1"
}
# ruleid: azure-functionapps-enable-auth
resource "azurerm_function_app" "bad2" {
  name = "bad2"
}
# ok: azure-functionapps-enable-auth
resource "azurerm_function_app" "good1" {
auth_settings {
  enabled = true
}
}
# ok: azure-functionapps-enable-auth
resource "azurerm_function_app" "good2" {
auth_settings {
  enabled = true
}
}
