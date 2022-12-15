variable "name" {
  description = "The name of the Firewall connection"

}

variable "location" {
  description = "The location/region where the firewall and pip will be created. The full list of Azure regions can be found at https://azure.microsoft.com/regions"

}

variable "resource_group_name" {
  description = "Default resource group name that the firewall and pip will be created in."
  default     = "myapp-rg"
}

variable "tags" {
  type = map(any)
}

variable "enable_force_tunneling" {
  description = "Enable force tunneling for the firewall"
  default     = false
}


# variable "firewall_config" {
#   description = "Manages an Azure Firewall configuration"
#   type = object({
#     name              = string
#     sku_name          = optional(string)
#     sku_tier          = optional(string)
#     dns_servers       = optional(list(string))
#     private_ip_ranges = optional(list(string))
#     threat_intel_mode = optional(string)
#     zones             = optional(list(string))
#     firewall_policy_id = optional(string)
#   })
# }

variable "sku_name" {
  description = "The name of the SKU for the firewall. Possible values are: 'Basic', 'Standard', 'Premium'"
  default     = "Standard"
}
variable "sku_tier" {

  description = "The tier of the firewall. Possible values are: 'Basic', 'Standard', 'Premium'"
  default     = "Standard"
}

variable "threat_intel_mode" {
  description = "The mode of the firewall. Possible values are: 'Off', 'Detection', 'Prevention'"
  default     = "Off"
}

variable "zones" {
  description = "The list of availability zones where the firewall will be created."
  default     = [1, 2, 3]
}

variable "private_ip_ranges" {
  description = "(optional) The list of private IP ranges to allow through the firewall."
  type        = set(string)

}

variable "dns_servers" {
  description = "(optional) The list of DNS servers to use for the firewall."
  type        = list(string)
  default     = []

}



variable "subnet_id" {
  description = "The subnet id to use for the firewall"

}

variable "mgmt_subnet_id" {
  description = "The management subnet id to use for the firewall"
  default     = null

}


variable "firewall_policy_id" {
  description = "The firewall policy id to use for the firewall"

}

variable "prefix_length" {
  description = "The prefix length to use for the firewall"
  default     = "30"
}
  