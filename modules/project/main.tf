locals {
  project_folder = coalesce(var.custom_project_folder, var.project_name)

  trigger_prefixes = [
    for prefix in var.filename_triggers :
    "${var.projects_path}/${local.project_folder}/${prefix}"
  ]
}

module "workspace" {
  source = "../workspaces"

  count = var.enabled ? 1 : 0

  agent_pool_id         = var.agent_pool_id
  auto_apply            = var.auto_apply
  file_triggers_enabled = true
  name                  = "${var.environment}-${var.project_name}"
  organization          = var.organization
  trigger_prefixes      = local.trigger_prefixes
  vcs_repo              = var.vcs_repo
  vcs_branch_override   = var.vcs_branch_override
  working_directory     = "${var.projects_path}/${local.project_folder}"
  terraform_version     = var.terraform_version
  execution_mode        = var.execution_mode
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
