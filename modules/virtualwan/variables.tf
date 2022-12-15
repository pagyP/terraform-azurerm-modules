variable "resource_group_name" {
  description = "Default resource group name that the network will be created in."
  default     = "myapp-rg"
}


variable "location" {
  description = "The location/region where the core network will be created. The full list of Azure regions can be found at https://azure.microsoft.com/regions"
    default     = "westeurope"
}

variable "name" {
  description = "The name of the virtual wan"
  default     = "vwan1"
}

variable "allow_branch_to_branch_traffic" {
  description = "Allow branch to branch traffic"
  default     = "true"
}
  
variable "type" {
  description = "The type of the virtual wan"
  default     = "Standard"
}

variable "office365_local_breakout_category" {
  description = "The office365 local breakout category"
  default     = "None"
}

variable "disable_vpn_encryption" {
  description = "Disable vpn encryption"
  default     = "false"
}
  

variable "hub_config" {
  type    = map(any)
  default = {}
}


variable "tags" {
  type    = map(any)
  default = {
    environment = "production"
    cost_center = "12345"
  }
}

