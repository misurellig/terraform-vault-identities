output "entity" {
  description = "Compex object for Vault identity entity"
  value       = vault_identity_entity.entity
}

output "alias" {
  description = "Vault identity entity alias resource output"
  value       = vault_identity_entity_alias.alias
}
