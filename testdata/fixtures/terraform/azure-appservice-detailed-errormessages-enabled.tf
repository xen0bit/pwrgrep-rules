# Fixture for azure-appservice-detailed-errormessages-enabled.
# ruleid: azure-appservice-detailed-errormessages-enabled
resource "azurerm_app_service" "bad1" {
  name = "bad1"
}
# ruleid: azure-appservice-detailed-errormessages-enabled
resource "azurerm_app_service" "bad2" {
  name = "bad2"
}
# ok: azure-appservice-detailed-errormessages-enabled
resource "azurerm_app_service" "good1" {
logs {
  detailed_error_messages_enabled = true
}
}
# ok: azure-appservice-detailed-errormessages-enabled
resource "azurerm_app_service" "good2" {
logs {
  detailed_error_messages_enabled = true
}
}
