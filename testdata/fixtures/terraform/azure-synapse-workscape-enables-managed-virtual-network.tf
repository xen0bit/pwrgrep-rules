# Fixture for azure-synapse-workscape-enables-managed-virtual-network.
# ruleid: azure-synapse-workscape-enables-managed-virtual-network
resource "azurerm_synapse_workspace" "bad1" {
  name = "bad1"
}
# ruleid: azure-synapse-workscape-enables-managed-virtual-network
resource "azurerm_synapse_workspace" "bad2" {
  name = "bad2"
}
# ok: azure-synapse-workscape-enables-managed-virtual-network
resource "azurerm_synapse_workspace" "good1" {
managed_virtual_network_enabled = true
}
# ok: azure-synapse-workscape-enables-managed-virtual-network
resource "azurerm_synapse_workspace" "good2" {
managed_virtual_network_enabled = true
}
