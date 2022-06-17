resource "azurerm_local_network_gateway" "locgw" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  gateway_address     = var.gateway_address
  address_space       = var.address_space
  tags                = var.tags


}