terraform {
  required_version = ">= 0.12"
}

provider "vault" {
  address   = "http://127.0.0.1:8200"
}

data "vault_identity_entity" "mozart" {
  entity_name = "mozart"
}

data "vault_identity_entity" "thebeatles" {
  entity_name = "thebeatles"
}

module "groups" {
  source = "../../modules/vault-identity-groups"

  groups = [
    {
      name              = "dba"
      type              = "internal"
      policies          = ["dba-owner"]
      member_group_ids  = []
      member_entity_ids = [data.vault_identity_entity.mozart.id]
      metadata          = {}
    },
    {
      name              = "qa"
      type              = "internal"
      policies          = ["qa-reader"]
      member_group_ids  = []
      member_entity_ids = [data.vault_identity_entity.thebeatles.id]
      metadata          = {}
    }
  ]
}

output "vault_identity_groups" {
  value = module.groups.group
}
