# vault-identy-entities module

This module creates Vault identity entities and relative aliases.

## Dependencies

Although this module does not strictly depend on any other module, alias creation in Vault depends on authentication method accessor to reference. Hence before creating an alias with this module, an authentication method must exist. This way this module does fetch it by relying on the [`vault_auth_backen`](https://www.terraform.io/docs/providers/vault/d/auth_backend.html) data source.

To create only entities without any alias just keep the variable `create_entity_aliases` to its default (false)

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
| aliases | Map of aliases linked to entities | `map` | `{}` |
| create_entity_aliases | Enable the creation of entity aliase | `bool` | `false` |
| entities | List object for the Vault identity entity | <pre>list(object({<br>    name     = string<br>    policies = list(string)<br>    metadata = map(string)<br>  }))</pre> | `[]` |

## Outputs

| Name | Description |
|------|-------------|
| alias | Vault identity entity alias resource output |
| entity | Complex object for Vault identity entity |
