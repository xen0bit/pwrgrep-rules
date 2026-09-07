# Fixture for azure-securitycenter-contact-emails.
# ruleid: azure-securitycenter-contact-emails
resource "azurerm_security_center_contact" "bad1" {
  name = "bad1"
}
# ruleid: azure-securitycenter-contact-emails
resource "azurerm_security_center_contact" "bad2" {
  name = "bad2"
}
# ok: azure-securitycenter-contact-emails
resource "azurerm_security_center_contact" "good1" {
email = "good1-val"
}
# ok: azure-securitycenter-contact-emails
resource "azurerm_security_center_contact" "good2" {
email = "good2-val"
}
