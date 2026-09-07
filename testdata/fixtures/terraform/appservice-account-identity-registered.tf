# Fixture for appservice-account-identity-registered.
# ruleid: appservice-account-identity-registered
resource "azurerm_app_service" "bad1" {
  name = "bad1"
}
# ruleid: appservice-account-identity-registered
resource "azurerm_app_service" "bad2" {
  name = "bad2"
}
# ok: appservice-account-identity-registered
resource "azurerm_app_service" "good1" {
  identity {
    type = "good1-val"
    identity_ids = "good1-val"
  }
}
# ok: appservice-account-identity-registered
resource "azurerm_app_service" "good2" {
  identity {
    type = "SystemAssigned"
  }
}
