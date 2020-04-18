output "vault_identity_entities" {
  description = "Map of Vault entity created"
  value       = module.vault_entities.entities
}

output "vault_identity_entity_alias" {
  description = "Map of Vault entity aliases created with relevant info"
  value       = module.vault_entities.alias
}

output "vault_identity_groups" {
  description = "List of maps with relevant info for Vault created groups"
  value       = module.groups.identity_group
}
