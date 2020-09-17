locals {
  # Build a map of our various Infrastructure resources that will be used to iterate over each module
  // infrastructure_resources = merge([
  //   for resource_file in fileset(path.cwd, "config/*.yaml") : {
  //     for k, v in yamldecode(file(resource_file)) : k => v
  //   }
  // ]...)

  infrastructure_files = fileset(path.cwd, "config/*.yaml")

  workspace_ids = merge([for p in local.infrastructure_files : { for k,v in module.tfc_workspace[p].workspace_ids : k => v }]...)
  workspace_globals = merge([for p in local.infrastructure_files : { for k,v in module.tfc_workspace[p].workspace_globals : k => v }]...)
  workspace_variables = merge([for p in local.infrastructure_files : { for k,v in module.tfc_workspace[p].workspace_variables : k => v }]...)
  workspace_triggers = merge([for p in local.infrastructure_files : { for k,v in module.tfc_workspace[p].workspace_triggers : k => v }]...)
}


module "tfc_workspace" {
  for_each = local.infrastructure_files

  source = "./workspaces"

  config_name = each.key
  organization = var.organization
}

module "tfc_globals" {
  for_each = local.workspace_globals

  source = "./variables"

  variables = each.value
  workspace_id = each.key
}

module "tfc_variables" {
  for_each = local.workspace_variables

  source = "./variables"

  variables = each.value
  workspace_id = each.key
  hcl = true
}

module "tfc_run_triggers" {
  for_each = local.workspace_triggers

  source = "./runtriggers"

  runtriggers = each.value
  workspace_id = each.key
  workspace_ids = local.workspace_ids
}