# Fixture for azure-waf-specificed-mode-app-gw.
# ruleid: azure-waf-specificed-mode-app-gw
resource "azurerm_web_application_firewall_policy" "bad1" {
policy_settings {
  enabled = false
}
}
# ruleid: azure-waf-specificed-mode-app-gw
resource "azurerm_web_application_firewall_policy" "bad2" {
policy_settings {
  enabled = false
}
}
# ok: azure-waf-specificed-mode-app-gw
resource "azurerm_web_application_firewall_policy" "good1" {
policy_settings {
  enabled = true
}
}
# ok: azure-waf-specificed-mode-app-gw
resource "azurerm_web_application_firewall_policy" "good2" {
  name = "good2"
}
