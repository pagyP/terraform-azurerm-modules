variable "name" {
  description = "Name of the route table"
  default     = "rt-rt01"
}

variable "resource_group_name" {
  description = "Default resource group name that the network will be created in."
  default     = "myapp-rg"
}

variable "location" {
  description = "The location/region where the core network will be created. The full list of Azure regions can be found at https://azure.microsoft.com/regions"
}

variable "tags" {
  description = "The tags to associate with your network and subnets."
  type        = map(any)

  default = {
    tag1 = "hello"
    tag2 = "there!"
  }
}


variable "routes" {
  type = map(any)
  default = {
    Default = {
      name                   = "Default-Route"
      address_prefix         = "0.0.0.0/0"
      next_hop_type          = "VirtualAppliance"
      next_hop_in_ip_address = "192.168.50.68"
    }
  }
}


variable "disable_bgp_route_propagation" {
  description = "Should BGP route propagation be disabled?"
  default     = false
}


