module "workspace" {
  source = "../workspaces"

  for_each = lookup(var.projects, "terraform", {})

  auto_apply            = false // TODO: verify
  file_triggers_enabled = true
  name                  = "${var.config_name}-${each.key}"
  organization          = var.organization
  trigger_prefixes      = ["projects/${each.key}/*.tf"]
  vcs_repo              = var.vcs_repo
  working_directory     = "${var.projects_path}/${each.key}" // TODO: add support for custom project directories
}

module "variables" {
  source = "../variables"

  for_each = lookup(var.projects, "terraform", {})

  hcl          = true
  variables    = each.value.vars
  workspace_id = module.workspace[each.key].workspace["id"]
}

module "env_vars" {
  source = "../variables"

  for_each = lookup(var.projects, "terraform", {})

  category     = "env"
  hcl          = false
  variables    = lookup(var.projects, "globals", {})
  workspace_id = module.workspace[each.key].workspace["id"]
}
