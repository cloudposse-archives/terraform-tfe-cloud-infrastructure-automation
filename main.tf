// TODO: Consider making this the primary project vs a submodule since it handles everything else
module "config" {
  source = "./modules/config"

  config_file_path    = var.config_file_path
  config_file_pattern = var.config_file_pattern
  organization        = var.organization
  projects_path       = trimsuffix(var.projects_path, "/")
  vcs_repo            = var.vcs_repo
}
