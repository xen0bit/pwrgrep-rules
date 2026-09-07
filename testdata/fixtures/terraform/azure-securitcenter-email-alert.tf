# Fixture for azure-securitcenter-email-alert.
# ruleid: azure-securitcenter-email-alert
resource "azurerm_security_center_contact" "bad1" {
  name = "bad1"
}
# ruleid: azure-securitcenter-email-alert
resource "azurerm_security_center_contact" "bad2" {
  name = "bad2"
}
# ok: azure-securitcenter-email-alert
resource "azurerm_security_center_contact" "good1" {
alert_notifications = true
}
# ok: azure-securitcenter-email-alert
resource "azurerm_security_center_contact" "good2" {
alert_notifications = true
}
