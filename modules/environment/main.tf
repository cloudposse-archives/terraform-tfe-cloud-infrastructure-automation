locals {
  default_execution_mode = "remote"
  environment_triggers = concat(["${var.config_directory}/${var.config_name}.yaml"], var.filename_triggers)
}

module "workspace" {
  source = "../workspaces"

  agent_pool_id         = var.agent_pool_id
  auto_apply            = true
  execution_mode        = local.default_execution_mode
  file_triggers_enabled = true
  name                  = var.config_name
  organization          = var.organization
  trigger_prefixes      = local.environment_triggers
  vcs_repo              = var.vcs_repo
}

module "variables" {
  source = "../variables"

  hcl          = true
  variables    = var.global_values
  workspace_id = module.workspace.workspace.id
}

module "projects" {
  source = "../project"

  for_each = var.projects

  agent_pool_id         = var.agent_pool_id
  auto_apply            = try(each.value.auto_apply, false)
  custom_project_folder = try(each.value.custom_project_folder, null)
  enabled               = try(each.value.workspace_enabled, false)
  environment           = module.workspace.workspace.name
  execution_mode        = try(each.value.execution_mode, local.default_execution_mode)
  filename_triggers     = concat(local.environment_triggers, try(each.value.filename_triggers, []))
  global_values         = var.global_values
  organization          = var.organization
  parent_workspace_id   = module.workspace.workspace.id
  project_name          = each.key
  project_values        = try(each.value.vars, {})
  projects_path         = var.projects_path
  terraform_version     = try(each.value.terraform_version, var.terraform_version)
  vcs_branch_override   = try(each.value.vcs_branch_override, null)
  vcs_repo              = var.vcs_repo
}
