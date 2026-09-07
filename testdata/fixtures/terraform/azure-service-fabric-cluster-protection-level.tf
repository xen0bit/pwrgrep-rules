# Fixture for azure-service-fabric-cluster-protection-level.
# ruleid: azure-service-fabric-cluster-protection-level
resource "azurerm_service_fabric_cluster" "bad1" {
  name = "bad1"
}
# ruleid: azure-service-fabric-cluster-protection-level
resource "azurerm_service_fabric_cluster" "bad2" {
  name = "bad2"
}
# ok: azure-service-fabric-cluster-protection-level
resource "azurerm_service_fabric_cluster" "good1" {
fabric_settings {
  name = "Security"
  parameters = {
    name = "ClusterProtectionLevel"
    value = "EncryptAndSign"
  }
}
}
# ok: azure-service-fabric-cluster-protection-level
resource "azurerm_service_fabric_cluster" "good2" {
fabric_settings {
  name = "Security"
  parameters = {
    name = "ClusterProtectionLevel"
    value = "EncryptAndSign"
  }
}
}
