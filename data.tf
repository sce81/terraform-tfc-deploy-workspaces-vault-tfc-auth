data "tfe_project" "main" {
  name         = "vault-admin"
  organization = var.organization
}

data "tfe_organization" "main" {
  name = var.organization
}

locals {

  vault_projects_repo = [
    {
      identifier     = "sce81/terraform-vault-provider-auth-root-module-projects"
      oauth_token_id = var.oauth_token_id
      branch         = "develop"
    }
  ]

  workspace_vars = {
    common_vars = {
      "common" = {
        "tfc_vault_addr" = {
          value       = var.tfc_vault_addr
          description = "Hostname of Vault Instance"
          category    = "terraform"
        },
      }
    }
    project_auth_vars = {
      ## OneTech Configuration
      "onetech-production" = {
        "vault_namespace" = {
          value       = "admin/onetech/production"
          description = "Namespace to authenticate project level vault provider at"
          category    = "terraform"
        },
        "vault_role_name" = {
          value       = "onetech-production"
          description = "Name of Vault Role to create"
          category    = "terraform"
        },
        "target_tfc_project" = {
          value       = "onetech-production"
          description = "Terraform Project in which to allocate Vault Role to"
          category    = "terraform"
        },
        "tfc_vault_namespace" = {
          value       = "admin/onetech/production"
          description = "Namespace in which to execute this configuration at"
          category    = "terraform"
        },
        "tfc_vault_run_role" = {
          value       = "onetech-production"
          description = "Vault Role in which to execute Terraform Project level configuration"
          category    = "terraform"
        },
      },
      "onetech-non-production" = {
        "vault_namespace" = {
          value       = "admin/onetech/non-production"
          description = "Namespace to authenticate project level vault provider at"
          category    = "terraform"
        },
        "vault_role_name" = {
          value       = "onetech-non-production"
          description = "Name of Vault Role to create"
          category    = "terraform"
        },
        "target_tfc_project" = {
          value       = "onetech-non-production"
          description = "Terraform Project in which to allocate Vault Role to"
          category    = "terraform"
        },
        "tfc_vault_namespace" = {
          value       = "admin/onetech/non-production"
          description = "Namespace in which to execute this configuration at"
          category    = "terraform"
        },
        "tfc_vault_run_role" = {
          value       = "onetech-non-production"
          description = "Vault Role in which to execute Terraform Project level configuration"
          category    = "terraform"
        },
      },
      ## Cloud Security Team Configuration
      "cloud-security-production" = {
        "vault_namespace" = {
          value       = "admin/cloud-security/production"
          description = "Namespace to authenticate project level vault provider at"
          category    = "terraform"
        },
        "vault_role_name" = {
          value       = "cloud-security-production"
          description = "Name of Vault Role to create"
          category    = "terraform"
        },
        "target_tfc_project" = {
          value       = "cloud-security-production"
          description = "Terraform Project in which to allocate Vault Role to"
          category    = "terraform"
        },
        "tfc_vault_namespace" = {
          value       = "admin/cloud-security/production"
          description = "Namespace in which to execute this configuration at"
          category    = "terraform"
        },
        "tfc_vault_run_role" = {
          value       = "cloud-security-production"
          description = "Vault Role in which to execute Terraform Project level configuration"
          category    = "terraform"
        },
      },
      "cloud-security-non-production" = {
        "vault_namespace" = {
          value       = "admin/cloud-security/non-production"
          description = "Namespace to authenticate project level vault provider at"
          category    = "terraform"
        },
        "vault_role_name" = {
          value       = "cloud-security-non-production"
          description = "Name of Vault Role to create"
          category    = "terraform"
        },
        "target_tfc_project" = {
          value       = "cloud-security-non-production"
          description = "Terraform Project in which to allocate Vault Role to"
          category    = "terraform"
        },
        "tfc_vault_namespace" = {
          value       = "admin/cloud-security/non-production"
          description = "Namespace in which to execute this configuration at"
          category    = "terraform"
        },
        "tfc_vault_run_role" = {
          value       = "cloud-security-non-production"
          description = "Vault Role in which to execute Terraform Project level configuration"
          category    = "terraform"
        },
      },
    },
  }
}
