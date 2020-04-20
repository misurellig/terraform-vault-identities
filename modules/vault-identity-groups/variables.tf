variable "groups" {
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
