output "route_table_id" {
  value = azurerm_route_table.rt.id
}

# output "route_table_ids_map" {
#   value = {
#     for route_table in azurerm_route_table.rt :
#     route_table.name => route_table.id
#   }
# }

