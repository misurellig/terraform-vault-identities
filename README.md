# terraform-vault-entities

This module creates [Hashicorp Vault](https://www.vaultproject.io/) entities and internal groups as part of its [Identity Secrets Engine](https://www.vaultproject.io/docs/secrets/identity).

The main module includes the following submodules:

  * The [vault-identity-entities](./modules/vault-identity-entities/) to create entities and provided aliases for them (see its README Dependencies section)
  * The [vault-identity-groups](./modules/vault-identity-groups) to create internal groups

## Usage
```hcl
module "entities" {
  source = "./vault-identity-entities"

  create_entity_aliases = true

  entities = [
    {
      name = "user-1",
      policies = ["policy-1", "policy-2"]
      metadata = {
        "metadata-1" = "value-1"
        "metadata-2" = "value-2"
      }
    },
    {
      name = "user-2",
      policies = ["policy-3", "policy-2"]
      metadata = {}
    }
  ]

  aliases = {
    "alias-1" = "user-1"
    "alias-2" = "user-2"
    "alias-3" = "user-3"
  }
}

module "vault_groups" {
  source = "./modules/vault-identity-groups"

  groups = [
    {
      name     = "group1"
      type     = "internal"
      policies = ["dbs-group-policy-1", "dbs-group-policy-2"]
      member_group_ids = []
      member_entity_ids = ["canonical-id-entity-1", "canonical-id-entity-2"]
      metadata = {
        "metadata-1" = "value"
        "metadata-2" = "value"      
      }
    }
  ]
}
```

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12 |

## Providers

| Name | Version |
|------|---------|
| vault | n/a |

## Inputs

| Name | Description | Type | Default |
|------|-------------|------|---------|
| create_vault_entity_aliases | n/a | `bool` | `false` |
| vault_endpoint | Vault endpoint | `string` | `"http://127.0.0.1:8200"` |
| vault_entity_objects | List object for the Vault identity entity | <pre>list(object({<br>    name     = string<br>    policies = list(string)<br>    metadata = map(string)<br>  }))</pre> | `[]` |
| vault_group_objects | List object for Vault identity group | <pre>list(object({<br>    name              = string<br>    type              = string<br>    policies          = list(string)<br>    member_group_ids  = list(string)<br>    member_entity_ids = list(string)<br>    metadata          = map(string)<br>  }))</pre> | `[]` |

## Outputs

| Name | Description |
|------|-------------|
| vault_identity_entities | Map of Vault entity created |
| vault_identity_entity_alias | Map of Vault entity aliases created with relevant info |
| vault_identity_groups | List of maps with relevant info for Vault created groups |
