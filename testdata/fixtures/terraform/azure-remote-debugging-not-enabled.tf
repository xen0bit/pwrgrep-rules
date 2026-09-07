# Fixture for azure-remote-debugging-not-enabled.
# ruleid: azure-remote-debugging-not-enabled
resource "azurerm_app_service" "bad1" {
remote_debugging_enabled = true
}
# ruleid: azure-remote-debugging-not-enabled
resource "azurerm_app_service" "bad2" {
remote_debugging_enabled = true
}
# ok: azure-remote-debugging-not-enabled
resource "azurerm_app_service" "good1" {
remote_debugging_enabled = false
}
# ok: azure-remote-debugging-not-enabled
resource "azurerm_app_service" "good2" {
  name = "good2"
}
