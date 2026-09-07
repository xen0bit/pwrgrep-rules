# Fixture for azure-frontdoor-use-wafmode.
# ruleid: azure-frontdoor-use-wafmode
resource "azurerm_frontdoor_firewall_policy" "bad1" {
policy_settings {
  enabled = false
}
}
# ruleid: azure-frontdoor-use-wafmode
resource "azurerm_frontdoor_firewall_policy" "bad2" {
policy_settings {
  enabled = false
}
}
# ok: azure-frontdoor-use-wafmode
resource "azurerm_frontdoor_firewall_policy" "good1" {
policy_settings {
  enabled = true
}
}
# ok: azure-frontdoor-use-wafmode
resource "azurerm_frontdoor_firewall_policy" "good2" {
  name = "good2"
}
