provider "azurerm" {
  features {}
}
resource "azurerm_resource_group" "rg" {
  name     = "vwan_rg"
  location = "westeurope"
}

resource "azurerm_virtual_wan" "vwan" {
  location            = var.location
  name                = var.name
  #resource_group_name = var.resource_group_name
  resource_group_name = azurerm_resource_group.rg.name
  allow_branch_to_branch_traffic = var.allow_branch_to_branch_traffic
  type = var.type
  disable_vpn_encryption = var.disable_vpn_encryption
  office365_local_breakout_category = var.office365_local_breakout_category
  tags                = var.tags
}

resource "azurerm_virtual_hub" "hub" {

    for_each = var.hub_config

  name = each.value.name
  #address_prefix      = var.hub_config
  address_prefix = each.value.address_prefix
  #location            = var.hub_config
  location = each.value.location
  #hub_name                = var.hub_config
  #sku                 = var.hub_config
  sku = each.value.sku
  #resource_group_name = var.resource_group_name
  resource_group_name = azurerm_resource_group.rg.name
  virtual_wan_id      = azurerm_virtual_wan.vwan.id
  tags                = var.tags
}