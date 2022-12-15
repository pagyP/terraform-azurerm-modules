resource "azurerm_virtual_network_gateway_connection" "vpncon" {
  name                       = var.name
  location                   = var.location
  resource_group_name        = var.resource_group_name
  type                       = var.type
  virtual_network_gateway_id = var.virtual_network_gateway_id
  local_network_gateway_id   = var.local_network_gateway_id
  shared_key                 = var.shared_key
  enable_bgp                 = var.enable_bgp
  tags                       = var.tags

}