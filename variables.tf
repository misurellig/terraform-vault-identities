variable "vault_endpoint" {
  description = "Vault endpoint"
  default     = "http://127.0.0.1:8200"
}

variable "create_vault_entity_aliases" {
  description = "Enable Vault entity alias creation"
  default     = false
}

variable "vault_entity_objects" {
  description = "List object for the Vault identity entity"
  type = list(object({
    name     = string
    policies = list(string)
    metadata = map(string)
  }))
  default = []
}

variable "vault_aliases_objects" {
  description = "List of objects defining the alias to entity and auth path match"
  type = list(object({
    name      = string
    entity    = string
    auth_path = string
  }))
  default = []
}

variable "vault_group_objects" {
  description = "List object for Vault identity group"
  type = list(object({
    name              = string
    type              = string
    policies          = list(string)
    member_group_ids  = list(string)
    member_entity_ids = list(string)
    metadata          = map(string)
  }))
  default = []
}
