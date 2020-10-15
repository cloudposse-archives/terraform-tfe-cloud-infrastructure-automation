module "example" {
  source = "../../"

  config_file_path = "config"
  organization     = var.organization

  vcs_repo = {
    branch             = var.branch
    identifier         = var.identifier
    ingress_submodules = var.ingress_submodules
    oauth_token_id     = var.oauth_token_id
  }
}
