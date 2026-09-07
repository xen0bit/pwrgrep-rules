# Fixture for azure-securitycenter-standard-pricing.
# ruleid: azure-securitycenter-standard-pricing
resource "azurerm_security_center_subscription_pricing" "bad1" {
  name = "bad1"
}
# ruleid: azure-securitycenter-standard-pricing
resource "azurerm_security_center_subscription_pricing" "bad2" {
  name = "bad2"
}
# ok: azure-securitycenter-standard-pricing
resource "azurerm_security_center_subscription_pricing" "good1" {
tier = "Standard"
}
# ok: azure-securitycenter-standard-pricing
resource "azurerm_security_center_subscription_pricing" "good2" {
tier = "Standard"
}
