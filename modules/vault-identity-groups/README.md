# vault-entities-groups

This module creates Vault identity groups **(no groups aliases provided yet)**.

## Usage
```hcl
module "groups" {
  source = "./vault-identity-groups"

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
    },
    {
      name     = "group2"
      type     = "internal"
      policies = ["dbs-group-policy-3", "dbs-group-policy-1"]
      member_group_ids = []
      member_entity_ids = ["canonical-id-entity-3", "canonical-id-entity-2"]
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
| groups | List object for Vault identity group | <pre>list(object({<br>    name     = string<br>    type     = string<br>    policies = list(string)<br>    member_group_ids = list(string)<br>    member_entity_ids = list(string)<br>    metadata = map(string)<br>  }))</pre> | `[]` |

## Outputs

| Name | Description |
|------|-------------|
| identity_group | Vault identity group resource output |
