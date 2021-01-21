# Configure the Terraform Enterprise Provider
provider "tfe" {
  hostname = var.tfe_hostname
  token    = var.tfe_token
}

module "example" {
  source = "../../"

  # Uncomment this to use a specific agent pool
  # agent_pool_id       = "ap-xxxyyyzzz"
  config_file_path    = "./stacks"
  config_file_pattern = "u*-testing.yaml"
  organization        = var.organization

  vcs_repo = {
    branch             = var.branch
    identifier         = var.identifier
    ingress_submodules = var.ingress_submodules
    oauth_token_id     = var.oauth_token_id
  }
}
