module "TFE_Workspace_Vault_Auth_Projects" {
  for_each = local.workspace_vars.project_auth_vars
  //source   = "/Users/simon.elliott/Documents/Code/New_Structure/Terraform_Modules/TFE/terraform-module-tfc-workspace-management"
  source        = "app.terraform.io/HashiCorp_AWS_Org/workspace-management/tfe"
  version       = "4.0.1"
  name          = "hcp_workspace_vault_provider_auth_${each.key}"
  organization  = data.tfe_organization.main.name
  vcs_repo      = local.vault_projects_repo
  tfe_variables = merge(each.value, local.workspace_vars.common_vars.common)
  project_id    = data.tfe_project.main.id
  workspace_tags = {
    "identifier" = each.key,
    "platform"   = "hcp",
    "target"     = "vault",
    "project"    = data.tfe_project.main.id
    "env"        = "vault-configuration"
  }
  sentinel_policy               = []
  auto_apply                    = true
  structured_run_output_enabled = "false"

}

