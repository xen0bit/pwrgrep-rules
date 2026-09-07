# Fixture for appservice-authentication-enabled.
# ruleid: appservice-authentication-enabled
resource "azurerm_app_service" "bad1" {
  name = "bad1"
}
# ruleid: appservice-authentication-enabled
resource "azurerm_app_service" "bad2" {
  auth_settings {
    enabled = false
  }
}
# ok: appservice-authentication-enabled
resource "azurerm_app_service" "good1" {
  auth_settings {
    enabled = true
  }
}
# ok: appservice-authentication-enabled
resource "azurerm_app_service" "good2" {
  auth_settings {
    enabled = true
  }
}
