locals {
  project_folder = coalesce(var.custom_project_folder, var.project_name)
}

module "workspace" {
  source = "../workspaces"

  count = var.enabled ? 1 : 0

  auto_apply            = false // TODO: verify
  file_triggers_enabled = true
  name                  = "${var.environment}-${var.project_name}"
  organization          = var.organization
  trigger_prefixes      = ["${var.projects_path}/${local.project_folder}/*.tf"]
  vcs_repo              = var.vcs_repo
  working_directory     = "${var.projects_path}/${local.project_folder}"
  terraform_version     = var.terraform_version
}

module "variables" {
  source = "../variables"

  count = var.enabled ? 1 : 0

  hcl          = true
  variables    = var.project_values
  workspace_id = module.workspace[0].workspace.id
}

module "env_vars" {
  source = "../variables"

  count = var.enabled ? 1 : 0

  category     = "env"
  hcl          = false
  variables    = var.global_values
  workspace_id = module.workspace[0].workspace.id
}

resource "tfe_run_trigger" "this" {
  count = var.enabled ? 1 : 0

  workspace_id  = module.workspace[0].workspace.id
  sourceable_id = var.parent_workspace_id
}
