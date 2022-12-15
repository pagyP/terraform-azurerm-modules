variable "name" {
  description = "The name of the VPN connection"

}

variable "location" {
  description = "The location/region where the core network will be created. The full list of Azure regions can be found at https://azure.microsoft.com/regions"

}

variable "resource_group_name" {
  description = "Default resource group name that the network will be created in."
  default     = "myapp-rg"
}

variable "virtual_network_gateway_id" {
  description = "The ID of the virtual network gateway"
}

variable "local_network_gateway_id" {
  description = "The ID of the local network gateway"

}

variable "shared_key" {
  description = "The shared key for the VPN connection"
}

variable "type" {
  description = "The type of the VPN connection"
  default     = "IPSec"
}

variable "enable_bgp" {
  description = "value to enable/disable BGP"
  type        = bool
  default = true
}


variable "tags" {
  description = "Tags for the Key Vault"
  type        = map(any)
}