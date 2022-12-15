variable "name" {
  description = "Name of the Key Vault"
  default     = "terraform-keyvault-%s"
  type        = string
}

variable "location" {
  description = "Location of the Key Vault"
  default     = "westeurope"
  type        = string
}

variable "enable_rbac_authorization" {
  description = "Enable RBAC authorization"
  default     = "true"
  type        = bool

}

variable "enabled_for_disk_encryption" {
  description = "Enable disk encryption"
  default     = "true"
  type        = bool

}

variable "enabled_for_template_deployment" {
  description = "Enable template deployment"
  default     = "true"
  type        = bool

}

variable "resource_group_name" {
  description = "Name of the resource group"
  default     = "terraform-keyvault-%s"
  type        = string
}

variable "soft_delete_retention_days" {
  description = "Soft delete retention days"
  default     = "90"
  type        = number
}

variable "purge_protection_enabled" {
  description = "Purge protection enabled"
  default     = "false"
  type        = bool
}

variable "tags" {
  description = "Tags for the Key Vault"
  type        = map(any)
}

