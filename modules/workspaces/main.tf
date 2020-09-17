locals {
  # Take config yaml and create a top level workspace name
  workspace_name = split(".", basename(var.config_name))[0]

  # YAML Decode the config file and create a map from it
  workspace_configuration = merge({for k, v in yamldecode(file(var.config_name)): k => v})

  # Create a map on the globals object
  workspace_globals = try({ for k, v in local.workspace_configuration.projects.globals: k => v }, {})

  # Create a map on the projects.terraform object ie currently not supporting helmfiles
  workspace_projects = try({ for k, v in local.workspace_configuration.projects.terraform: k => v }, {}) 

  # Create a merged master map of all workspace name and ids
  workspace_ids = merge(
    { 
      for p in keys(local.workspace_projects) : tfe_workspace.sub_project["${p}"].name => tfe_workspace.sub_project["${p}"].id 
    },
    {
      (local.workspace_name) = tfe_workspace.top_level.id 
    }
  )

  # This is a temp variable to aide in creating a map for other modules
  temp_workspace_ids = { for p in keys(local.workspace_projects) : p => tfe_workspace.sub_project["${p}"].id }
  

  # These maps are exported as outputs for other modules
  id_globals_map = { for name, id in local.workspace_ids : id => local.workspace_globals }
  id_variables_map = { for name, id in local.temp_workspace_ids : id => try(local.workspace_configuration.projects.terraform[name].vars,{}) }
  id_triggers_map = { for name, id in local.temp_workspace_ids : id => try(local.workspace_configuration.projects.terraform[name].triggers,[]) }
}


resource "tfe_workspace" "top_level" {
  name         = local.workspace_name
  organization = var.organization

  auto_apply            = var.auto_apply
  file_triggers_enabled = var.file_triggers_enabled
  queue_all_runs        = var.queue_all_runs
  ssh_key_id            = var.ssh_key_id
  terraform_version     = var.terraform_version
  trigger_prefixes      = var.trigger_prefixes
  

  dynamic "vcs_repo" {
    for_each = lookup(var.vcs_repo, "identifier", "void") == "void" ? [] : [var.vcs_repo]
    content {
      branch             = lookup(var.vcs_repo, "branch", null)
      identifier         = lookup(var.vcs_repo, "identifier", null)
      ingress_submodules = lookup(var.vcs_repo, "ingress_submodules", null)
      oauth_token_id     = lookup(var.vcs_repo, "oauth_token_id", null)
    }
  }

  working_directory = var.working_directory
}

resource "tfe_workspace" "sub_project" {
  for_each = local.workspace_projects

  name         = "${local.workspace_name}-${each.key}"
  organization = var.organization

  auto_apply            = var.auto_apply
  file_triggers_enabled = var.file_triggers_enabled
  queue_all_runs        = var.queue_all_runs
  ssh_key_id            = var.ssh_key_id
  terraform_version     = var.terraform_version
  trigger_prefixes      = var.trigger_prefixes
  

  dynamic "vcs_repo" {
    for_each = lookup(var.vcs_repo, "identifier", "void") == "void" ? [] : [var.vcs_repo]
    content {
      branch             = lookup(var.vcs_repo, "branch", null)
      identifier         = lookup(var.vcs_repo, "identifier", null)
      ingress_submodules = lookup(var.vcs_repo, "ingress_submodules", null)
      oauth_token_id     = lookup(var.vcs_repo, "oauth_token_id", null)
    }
  }

  working_directory = var.working_directory
}
