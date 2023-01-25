

resource "azurerm_resource_group" "main" {
  name     = "${var.resource_group_name}-rg"
  location = var.location
  tags     = var.tags
}