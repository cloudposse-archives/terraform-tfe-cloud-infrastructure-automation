resource "tfe_workspace" "this" {
  name         = var.name
  organization = var.organization

  auto_apply            = var.auto_apply
  file_triggers_enabled = var.file_triggers_enabled
  operations            = var.operations
  queue_all_runs        = var.queue_all_runs
  ssh_key_id            = var.ssh_key_id
  terraform_version     = var.terraform_version
  trigger_prefixes      = var.trigger_prefixes
  working_directory     = var.working_directory

  dynamic "vcs_repo" {
    for_each = lookup(var.vcs_repo, "identifier", "void") == "void" ? [] : [var.vcs_repo]

    content {
      branch             = var.vcs_branch == null ? var.vcs_repo.branch : var.vcs_branch
      identifier         = var.vcs_repo.identifier
      ingress_submodules = var.vcs_repo.ingress_submodules
      oauth_token_id     = var.vcs_repo.oauth_token_id
    }
  }
}
