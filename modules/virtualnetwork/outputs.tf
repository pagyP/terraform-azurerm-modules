output "vnet_id" {
  description = "The id of the virtual network."
  value       = azurerm_virtual_network.vnet.id
}

output "subnet_ids_map" {

  depends_on = [azurerm_subnet.subnet]
  #value = azurerm_subnet.hub_subnet[each.key]
  value = {
    for subnet in azurerm_subnet.subnet :
    subnet.name => subnet.id
  }
}

output "firewallsubnet" {
  value = lookup(azurerm_subnet.subnet, "AzureFirewallSubnet", null)
}

output "firewallmanagementsubnet" {
  value = lookup(azurerm_subnet.subnet, "AzureFirewallManagementSubnet", null)
}

output "vnet_name" {
  description = "The name of the virtual network."
  value       = azurerm_virtual_network.vnet.name
}
  
