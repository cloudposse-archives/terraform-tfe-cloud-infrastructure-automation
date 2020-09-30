provider "tfe" {
  token = var.token
}

module "tfc_workspace" {
  source = "./modules/workspaces"

  config_name = var.config_name
  organization = var.organization
  file_triggers_enabled = var.file_triggers_enabled
  vcs_repo = var.vcs_repo
}

module "tfc_variables" {
  source = "./modules/variables"

  variables = var.variables
  workspace_id = var.workspace_id
  hcl = var.hcl
}

module "tfc_run_triggers" {
  source = "./modules/runtriggers"

  runtriggers = var.runtriggers
  workspace_id = var.workspace_id
  workspace_ids = var.workspace_ids
}