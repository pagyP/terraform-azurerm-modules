resource "azurerm_virtual_network" "vnet" {
  name                = var.name
  location            = var.location
  address_space       = var.address_space
  resource_group_name = var.resource_group_name
  dns_servers         = var.dns_servers
  tags                = var.tags
}

resource "azurerm_subnet" "subnet" {
  for_each = var.subnet_config

  name = each.value.name
  #resource_group_name  = azurerm_resource_group.hubvnetrg.name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [each.value.cidr_base]
}