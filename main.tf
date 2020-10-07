locals {
  // Use the provided config file path or default to the current dir
  config_file_path = coalesce(var.config_file_path, path.cwd)
  // Result ex: [gbl-audit.yaml, gbl-auto.yaml, gbl-dev.yaml, ...]
  config_filenames = fileset(local.config_file_path, var.config_file_pattern)
  // Result ex: [gbl-audit, gbl-auto, gbl-dev, ...]
  config_files = { for f in local.config_filenames : trimsuffix(basename(f), ".yaml") => yamldecode(file("${local.config_file_path}/${f}")) }
  // Result ex: { gbl-audit = { globals = { ... }, terraform = { project1 = { vars = ... }, project2 = { vars = ... } } } }
  projects = { for f in keys(local.config_files) : f => lookup(local.config_files[f], "projects", {}) }
}

module "tfc_config" {
  source = "./modules/workspaces"

  auto_apply            = true
  file_triggers_enabled = true
  name                  = "tfc-config"
  organization          = var.organization
  terraform_version     = var.terraform_version
  trigger_prefixes      = [basename(local.config_file_path)]
  vcs_repo              = var.vcs_repo
  working_directory     = "${var.projects_path}/tfc"
}

module "tfc_projects" {
  source = "./modules/project"

  for_each = local.projects

  config_name   = each.key
  organization  = var.organization
  projects      = each.value
  projects_path = var.projects_path
  vcs_repo      = var.vcs_repo
}

# TODO: support run triggers
# module "tfc_run_triggers" {
#   source = "./modules/runtriggers"

#   for_each = local.workspace_triggers

#   runtriggers   = each.value
#   workspace_id  = each.key
#   workspace_ids = local.workspace_ids
# }
