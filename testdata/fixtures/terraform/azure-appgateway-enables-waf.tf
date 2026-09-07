# Fixture for azure-appgateway-enables-waf.
# ruleid: azure-appgateway-enables-waf
resource "azurerm_application_gateway" "bad1" {
  name = "bad1"
}
# ruleid: azure-appgateway-enables-waf
resource "azurerm_application_gateway" "bad2" {
  name = "bad2"
}
# ok: azure-appgateway-enables-waf
resource "azurerm_application_gateway" "good1" {
waf_configuration {
  enabled = true
}
}
# ok: azure-appgateway-enables-waf
resource "azurerm_application_gateway" "good2" {
waf_configuration {
  enabled = true
}
}
