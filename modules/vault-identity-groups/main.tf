terraform {
  required_version = ">= 0.12"
}

resource "vault_identity_group" "group" {
  for_each = {
    for group in var.groups :
    group.name => group
  }

  name              = each.key
  type              = each.value.type
  policies          = each.value.policies
  member_group_ids  = each.value.member_group_ids
  member_entity_ids = each.value.member_entity_ids
  metadata          = each.value.metadata
}
