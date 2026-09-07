# azure-network-watcher-flowlog-period: short flow-log retention.
# ruleid: azure-network-watcher-flowlog-period
resource "azurerm_network_watcher_flow_log" "short" {
  name = "short"
  retention_policy {
    enabled = true
    days = 30
  }
}

# ruleid: azure-network-watcher-flowlog-period
resource "azurerm_network_watcher_flow_log" "shorter" {
  name = "shorter"
  retention_policy {
    enabled = true
    days = 89
  }
}

# ok: azure-network-watcher-flowlog-period
resource "azurerm_network_watcher_flow_log" "long" {
  name = "long"
  retention_policy {
    enabled = true
    days = 365
  }
}

# ok: azure-network-watcher-flowlog-period
resource "azurerm_network_watcher_flow_log" "off" {
  name = "off"
  retention_policy {
    enabled = true
    days = 0
  }
}
