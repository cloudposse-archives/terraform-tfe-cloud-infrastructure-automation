resource "tfe_workspace" "this" {
  name         = var.name
  organization = var.organization

  agent_pool_id         = var.agent_pool_id
  auto_apply            = var.auto_apply
  file_triggers_enabled = var.file_triggers_enabled
  execution_mode        = var.agent_pool_id != null ? "agent" : var.execution_mode
  queue_all_runs        = var.queue_all_runs
  ssh_key_id            = var.ssh_key_id
  terraform_version     = var.terraform_version
  trigger_prefixes      = var.trigger_prefixes
  working_directory     = var.working_directory

  dynamic "vcs_repo" {
    for_each = lookup(var.vcs_repo, "identifier", "void") == "void" ? [] : [var.vcs_repo]

    content {
      branch             = var.vcs_branch_override == null ? var.vcs_repo.branch : var.vcs_branch_override
      identifier         = var.vcs_repo.identifier
      ingress_submodules = var.vcs_repo.ingress_submodules
      oauth_token_id     = var.vcs_repo.oauth_token_id
    }
  }
}
