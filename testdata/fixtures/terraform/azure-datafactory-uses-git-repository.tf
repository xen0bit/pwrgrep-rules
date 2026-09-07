# Fixture for azure-datafactory-uses-git-repository.
# ruleid: azure-datafactory-uses-git-repository
resource "azurerm_data_factory" "bad1" {
  name = "bad1"
}
# ruleid: azure-datafactory-uses-git-repository
resource "azurerm_data_factory" "bad2" {
  name = "bad2"
}
# ok: azure-datafactory-uses-git-repository
resource "azurerm_data_factory" "good1" {
github_configuration {
}
}
# ok: azure-datafactory-uses-git-repository
resource "azurerm_data_factory" "good2" {
vsts_configuration {
}
}
