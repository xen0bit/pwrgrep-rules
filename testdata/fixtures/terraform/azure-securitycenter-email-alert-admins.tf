# Fixture for azure-securitycenter-email-alert-admins.
# ruleid: azure-securitycenter-email-alert-admins
resource "azurerm_security_center_contact" "bad1" {
  name = "bad1"
}
# ruleid: azure-securitycenter-email-alert-admins
resource "azurerm_security_center_contact" "bad2" {
  name = "bad2"
}
# ok: azure-securitycenter-email-alert-admins
resource "azurerm_security_center_contact" "good1" {
alerts_to_admins = true
}
# ok: azure-securitycenter-email-alert-admins
resource "azurerm_security_center_contact" "good2" {
alerts_to_admins = true
}
