# azure-customrole-definition-subscription-owner: wildcard actions on a role.
resource "azurerm_role_definition" "bad" {
  permissions {
    # ruleid: azure-customrole-definition-subscription-owner
    actions = ["*"]
  }
  name = "bad"
}

resource "azurerm_role_definition" "bad2" {
  permissions {
    # ruleid: azure-customrole-definition-subscription-owner
    actions = ["*", "Microsoft.Compute/read"]
  }
  name = "bad2"
}

resource "azurerm_role_definition" "good" {
  permissions {
    # ok: azure-customrole-definition-subscription-owner
    actions = ["Microsoft.Compute/read"]
  }
  name = "good"
}

resource "azurerm_role_definition" "plain" {
  # ok: azure-customrole-definition-subscription-owner
  name = "plain"
}
