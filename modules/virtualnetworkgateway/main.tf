locals {
  gateway_name     = "${var.name}-gateway"
  gateway_pip_name = "${var.name}-gateway-pip"
}
resource "azurerm_public_ip" "vpngw" {
  name                = local.gateway_pip_name
  location            = var.location
  resource_group_name = var.resource_group_name

  allocation_method = "Dynamic"
  tags              = var.tags
}


resource "azurerm_virtual_network_gateway" "main" {
  name                = local.gateway_name
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags

  type     = "Vpn"
  vpn_type = "RouteBased"

  active_active = var.active_active
  enable_bgp    = var.enable_bgp
  sku           = var.vpngwsku


  ip_configuration {
    name                          = "vnetGatewayConfig"
    public_ip_address_id          = azurerm_public_ip.vpngw.id
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = var.gatewaysubnetid
  }
}