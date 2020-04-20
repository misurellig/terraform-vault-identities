terraform {
  required_version = ">= 0.12"
}

data "vault_auth_backend" "backend" {
  for_each = {
    for alias in var.aliases :
    alias.name => alias
  }
  path = each.value.auth_path
}

resource "vault_identity_entity" "entity" {
  for_each = {
    for entity in var.entities :
    entity.name => entity
  }
  name     = each.key
  policies = each.value.policies
  metadata = each.value.metadata
}

resource "vault_identity_entity_alias" "alias" {
  for_each = {
    for alias in var.aliases :
    alias.name => alias
    if var.create_entity_aliases
  }

  name           = each.key
  mount_accessor = lookup(data.vault_auth_backend.backend[each.key], "accessor", null)
  canonical_id   = vault_identity_entity.entity[each.value.entity].id
}
