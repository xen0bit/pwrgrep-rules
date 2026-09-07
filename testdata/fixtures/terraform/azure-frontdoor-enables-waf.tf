# Fixture for azure-frontdoor-enables-waf.
# ruleid: azure-frontdoor-enables-waf
resource "azurerm_frontdoor" "bad1" {
  name = "bad1"
}
# ruleid: azure-frontdoor-enables-waf
resource "azurerm_frontdoor" "bad2" {
  name = "bad2"
}
# ok: azure-frontdoor-enables-waf
resource "azurerm_frontdoor" "good1" {
web_application_firewall_policy_link_id = "good1-val"
}
# ok: azure-frontdoor-enables-waf
resource "azurerm_frontdoor" "good2" {
web_application_firewall_policy_link_id = "good2-val"
}
