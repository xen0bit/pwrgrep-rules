# Fixture for functionapp-authentication-enabled.
# ruleid: functionapp-authentication-enabled
resource "azurerm_function_app" "bad1" {
  name = "bad1"
}
# ruleid: functionapp-authentication-enabled
resource "azurerm_function_app" "bad2" {
  auth_settings {
    enabled = false
  }
}
# ok: functionapp-authentication-enabled
resource "azurerm_function_app" "good1" {
  auth_settings {
    enabled = true
  }
}
# ok: functionapp-authentication-enabled
resource "azurerm_function_app" "good2" {
  auth_settings {
    enabled = true
  }
}
