# Fixture for azure-sqlserver-no-public-access.
# ruleid: azure-sqlserver-no-public-access
resource "azurerm_mysql_firewall_rule" "bad1" {
start_ip_address    = "0.0.0.0"
end_ip_address      = "255.255.255.255"
}
# ruleid: azure-sqlserver-no-public-access
resource "azurerm_mysql_firewall_rule" "bad2" {
start_ip_address    = "0.0.0.0"
end_ip_address      = "255.255.255.255"
}
# ok: azure-sqlserver-no-public-access
resource "azurerm_mysql_firewall_rule" "good1" {
start_ip_address    = "safe-fixed"
end_ip_address      = "255.255.255.255"
}
# ok: azure-sqlserver-no-public-access
resource "azurerm_mysql_firewall_rule" "good2" {
  name = "good2"
}
