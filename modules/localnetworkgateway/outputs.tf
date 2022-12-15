output "local_network_gateway_id" {
  description = "The id of the virtual network."
  value       = azurerm_local_network_gateway.locgw.id
}