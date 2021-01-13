locals {
  default_execution_mode = "remote"
}

module "workspace" {
  source = "../workspaces"

  auto_apply            = true
  file_triggers_enabled = true
  name                  = var.config_name
  organization          = var.organization
  trigger_prefixes      = ["${var.config_directory}/${var.config_name}.yaml"]
  vcs_repo              = var.vcs_repo
  execution_mode        = local.default_execution_mode
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

  enabled               = try(each.value.workspace_enabled, false)
  organization          = var.organization
  environment           = module.workspace.workspace.name
  global_values         = var.global_values
  project_name          = each.key
  project_values        = each.value.vars
  projects_path         = var.projects_path
  custom_project_folder = try(each.value.custom_project_folder, null)
  execution_mode        = try(each.value.execution_mode, local.default_execution_mode)
  vcs_repo              = var.vcs_repo
  vcs_branch_override   = try(each.value.vcs_branch_override, null)
  terraform_version     = try(each.value.terraform_version, var.terraform_version)
  parent_workspace_id   = module.workspace.workspace.id
  auto_apply            = try(each.value.auto_apply, false)
  filename_triggers     = try(each.value.filename_triggers, [])
}
