# Fixture for azure-postgresql-server-log-checkpoint-enabled.
# ruleid: azure-postgresql-server-log-checkpoint-enabled
resource "azurerm_postgresql_configuration" "bad1" {
  name = "bad1"
}
# ruleid: azure-postgresql-server-log-checkpoint-enabled
resource "azurerm_postgresql_configuration" "bad2" {
  name = "bad2"
}
# ok: azure-postgresql-server-log-checkpoint-enabled
resource "azurerm_postgresql_configuration" "good1" {
name = "log_checkpoints"
value = "on"
}
# ok: azure-postgresql-server-log-checkpoint-enabled
resource "azurerm_postgresql_configuration" "good2" {
name = "log_checkpoints"
value = "on"
}
