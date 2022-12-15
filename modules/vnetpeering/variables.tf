
variable "name" {
  type        = string
  description = "Name of the vnet peering to create"
  default     = "vnet-peer"
}
  
variable "resource_group_name" {
  type        = string
  description = "Default resource group name that the network will be created in."
  default     = "hub-vnet-rg"
}
  
variable "virtual_network_name" {
  type        = string
  description = "Name of the vnet to create"
  default     = "hub_vnet"
}

variable "allow_forwarded_traffic" {
  type        = bool
  description = "Allow forwarded traffic"
  default     = true
}
  
variable "allow_gateway_transit" {
  type        = bool
  description = "Allow gateway transit"
  default     = false
  
}

variable "allow_virtual_network_access" {
  type        = bool
  description = "Allow virtual network access"
  default     = true
}

variable "use_remote_gateways" {
  type        = bool
  description = "Use remote gateways"
  default     = false
}
  
variable "remote_virtual_network_id" {
  type        = string
  description = "Remote virtual network ID"
  default     = ""
}

# variable "tags" {
#   type = map(any)
# }