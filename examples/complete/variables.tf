variable "branch" {
  description = "The repository branch that Terraform will execute from."
  default     = "master"
  type        = string
}

variable "identifier" {
  description = "A reference to your VCS repository in the format :org/:repo where :org and :repo refer to the organization and repository in your VCS provider."
  type        = string
}

variable "ingress_submodules" {
  default     = false
  description = "Whether submodules should be fetched when cloning the VCS repository. Defaults to `false`."
  type        = bool
}

variable "oauth_token_id" {
  default     = null
  description = "Token ID of the VCS Connection (OAuth Connection Token) to use."
  type        = string
}

variable "organization" {
  description = "Name of the organization."
  type        = string
}

variable "tfe_hostname" {
  description = "The Terraform Enterprise hostname to connect to. Defaults to `app.terraform.io`. Can be overridden by setting the `TFE_HOSTNAME` environment variable."
  default     = "app.terraform.io"
  type        = string
}

variable "tfe_token" {
  description = "The token used to authenticate with Terraform Enterprise. Only set this argument when running in a Terraform Enterprise workspace; for CLI usage, omit the token from the configuration and set it as `credentials` in the CLI config file or set the `TFE_TOKEN` environment variable."
  default     = null
  type        = string
}
