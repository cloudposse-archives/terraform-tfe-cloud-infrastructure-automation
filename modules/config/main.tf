locals {
  infrastructure_files = fileset(path.cwd, "config/*.yaml")

  workspace_ids = merge([for p in local.infrastructure_files : { for k,v in module.tfc_workspace[p].workspace_ids : k => v }]...)
  workspace_globals = merge([for p in local.infrastructure_files : { for k,v in module.tfc_workspace[p].workspace_globals : k => v }]...)
  workspace_variables = merge([for p in local.infrastructure_files : { for k,v in module.tfc_workspace[p].workspace_variables : k => v }]...)
  workspace_triggers = merge([for p in local.infrastructure_files : { for k,v in module.tfc_workspace[p].workspace_triggers : k => v }]...)
}

provider "tfe" {
  token = var.token
}

module "tfc_workspace_config" {
  source = "./modules/workspaces"

  config_name = "config"
  organization = var.organization
  file_triggers_enabled = true
  vcs_repo = var.vcs_repo
}

module "tfc_workspace_toplevel" {
  for_each = local.infrastructure_files

  source = "./modules/workspaces"

  config_name = each.key
  organization = var.organization
  file_triggers_enabled = true
  vcs_repo = var.vcs_repo
}

module "tfc_workspace_subproject" {
  for_each = local.infrastructure_files

  source = "./modules/workspaces"

  config_name = each.key
  organization = var.organization
  file_triggers_enabled = true
  vcs_repo = var.vcs_repo
}

module "tfc_globals" {
  for_each = local.workspace_globals

  source = "./modules/variables"

  variables = each.value
  workspace_id = each.key
}

module "tfc_workspace_globals" {
  for_each = local.workspace_globals

  source = "./modules/variables"

  variables = each.value
  workspace_id = each.key
}

module "tfc_workspace_variables" {
  for_each = local.workspace_variables

  source = "./modules/variables"

  variables = each.value
  workspace_id = each.key
  hcl = true
}

module "tfc_run_triggers" {
  for_each = local.workspace_triggers

  source = "./modules/runtriggers"

  runtriggers = each.value
  workspace_id = each.key
  workspace_ids = local.workspace_ids
}