variable "resource_group_name" {
  description = "Default resource group name that the network will be created in."
  default     = "myapp-rg"
}

variable "location" {
  description = "The location/region where the core network will be created. The full list of Azure regions can be found at https://azure.microsoft.com/regions"
}

variable "gateway_address" {
  description = "The address that the local network gateway will be listening on."
}

variable "address_space" {
  description = "The address space that is used by the virtual network."
  default     = []
}

variable "name" {
  description = "The name of the local network gateway"
  default     = "myapp-local-gateway"
}

variable "tags" {
  description = "Tags for the Key Vault"
  type        = map(any)
}
