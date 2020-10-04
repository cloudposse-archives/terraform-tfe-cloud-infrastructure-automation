resource "tfe_workspace" "this" {
  name         = var.config_name
  organization = var.organization

  auto_apply            = var.auto_apply
  file_triggers_enabled = var.file_triggers_enabled
  operations            = var.operations
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
