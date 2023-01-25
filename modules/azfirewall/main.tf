locals {
  firewall_name               = "${var.name}-firewall"
  firewall_pip_name           = "${local.firewall_name}-pip"
  firewall_public_prefix_name = "${local.firewall_name}-public-prefix"
}

# terraform {
#   experiments = [module_variable_optional_attrs]
# }

resource "azurerm_public_ip" "main" {
  name                = local.firewall_pip_name
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = "Static"
  sku                 = "Standard"
  zones               = var.zones
  public_ip_prefix_id = azurerm_public_ip_prefix.fw.id
  tags                = var.tags
}

resource "azurerm_public_ip_prefix" "main" {
  name                = local.firewall_public_prefix_name
  resource_group_name = var.resource_group_name
  location            = var.location
  prefix_length       = var.prefix_length
  zones               = var.zones
  sku                 = "Standard"
  tags                = var.tags

}

resource "azurerm_public_ip" "main" {
  count               = var.enable_force_tunneling ? 1 : 0
  name                = "${local.firewall_name}-mgmt-pip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
  zones               = var.zones
  tags                = var.tags
}

resource "azurerm_firewall" "main" {
  #name = "${var.firewall_config.name}-${local.firewall_name}"
  name                = local.firewall_name
  resource_group_name = var.resource_group_name
  firewall_policy_id  = var.firewall_policy_id
  location            = var.location
  ip_configuration {
    name                 = "firewallConfig"
    public_ip_address_id = azurerm_public_ip.fw.id
    #public_ip_address_id = azurerm_public_ip_prefix.fw.id
    subnet_id = var.subnet_id

  }
  dynamic "management_ip_configuration" {
    for_each = var.enable_force_tunneling ? [1] : []
    content {
      name                 = "managementConfig"
      public_ip_address_id = azurerm_public_ip.fw-mgmt-pip.0.id
      #public_ip_address_id = azurerm_public_ip_prefix.fw.id
      subnet_id = var.mgmt_subnet_id
    }

  }
  sku_name = var.sku_name
  sku_tier = var.sku_tier
  #firewall_policy_id = var.firewall_config.firewall_policy_id
  threat_intel_mode = var.threat_intel_mode
  zones             = var.zones
  private_ip_ranges = var.private_ip_ranges
  #dns_servers = var.dns_servers
  tags = var.tags

}