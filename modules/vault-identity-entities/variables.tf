variable "entities" {
  description = "List of objects for the Vault identity entity"
  type = list(object({
    name     = string
    policies = list(string)
    metadata = map(string)
  }))
  default = []
}

variable "create_entity_aliases" {
  default = false
}

variable "aliases" {
  description = "List of objects defining the alias to entity and auth path match"
  type = list(object({
    name      = string
    entity    = string
    auth_path = string
  }))
  default = []
}
