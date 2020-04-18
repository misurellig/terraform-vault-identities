terraform {
  required_version = ">= 0.12"
}

provider "vault" {
  address   = "http://127.0.0.1:8200"
}

module "entities" {
  source = "../../modules/vault-identity-entities"

  entities = [
    {
      name     = "mozart",
      policies = ["composer", "director"]
      metadata = {
        "category" = "Classical"
        "level"     = "genious"
      }
    },
    {
      name     = "thebeatles",
      policies = ["band", "rock-n-roll"]
      metadata = {
        "category" = "English pop rock"
        "level"    = "over the top"
      }
    }
  ]
}

output "vault_identity_entities" {
  value = module.entities.entity
}
