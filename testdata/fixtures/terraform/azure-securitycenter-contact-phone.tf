# Fixture for azure-securitycenter-contact-phone.
# ruleid: azure-securitycenter-contact-phone
resource "azurerm_security_center_contact" "bad1" {
  name = "bad1"
}
# ruleid: azure-securitycenter-contact-phone
resource "azurerm_security_center_contact" "bad2" {
  name = "bad2"
}
# ok: azure-securitycenter-contact-phone
resource "azurerm_security_center_contact" "good1" {
phone = "good1-val"
}
# ok: azure-securitycenter-contact-phone
resource "azurerm_security_center_contact" "good2" {
phone = "good2-val"
}
