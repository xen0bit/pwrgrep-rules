# Fixture for azure-automation-encrypted.
# ruleid: azure-automation-encrypted
resource "azurerm_automation_variable_string" "bad1" {
  name = "bad1"
}
# ruleid: azure-automation-encrypted
resource "azurerm_automation_variable_datetime" "bad2" {
  name = "bad2"
}
# ok: azure-automation-encrypted
resource "azurerm_automation_variable_string" "good1" {
encrypted = true
}
# ok: azure-automation-encrypted
resource "azurerm_automation_variable_datetime" "good2" {
encrypted = true
}
