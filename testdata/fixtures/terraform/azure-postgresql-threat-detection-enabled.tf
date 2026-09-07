# Fixture for azure-postgresql-threat-detection-enabled.
# ruleid: azure-postgresql-threat-detection-enabled
resource "azurerm_postgresql_server" "bad1" {
  name = "bad1"
}
# ruleid: azure-postgresql-threat-detection-enabled
resource "azurerm_postgresql_server" "bad2" {
  name = "bad2"
}
# ok: azure-postgresql-threat-detection-enabled
resource "azurerm_postgresql_server" "good1" {
threat_detection_policy {
    enabled = true
}
}
# ok: azure-postgresql-threat-detection-enabled
resource "azurerm_postgresql_server" "good2" {
threat_detection_policy {
    enabled = true
}
}
