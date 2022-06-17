variable "name" {
  description = "The name of the secret"
  default     = "my-secret"
  type        = string
}

variable "key_vault_id" {
  description = "The ID of the key vault"
  default     = "my-key-vault"
  type        = string
}


variable "value" {
  description = "The value of the secret"
  default     = "my-secret-value"
  type        = string
}