terraform {
  required_version = ">= 0.12"
}

provider "vault" {
  address   = var.vault_endpoint
}

module "vault_entities" {
  source = "./modules/vault-identity-entities"

  create_entity_aliases = var.create_vault_entity_aliases
  entities             = var.vault_entity_objects
}

module "vault_groups" {
  source = "./modules/vault-identity-groups"

  groups = var.vault_group_objects
}
