variable "config_auto_apply" {
  type        = bool
  description = "Controls Terraform Cloud workspace auto-apply feature"
  default     = true
}

variable "config_file_path" {
  type        = string
  description = "Relative path to YAML config files"
  default     = null
}

variable "config_file_pattern" {
  type        = string
  description = "File pattern used to locate configuration files"
  default     = "*.yaml"
}

variable "organization" {
  type        = string
  description = "Name of the organization."
}

variable "projects_path" {
  description = "Project directory repository-root-relative path"
  default     = "projects"
  type        = string
}

variable "terraform_version" {
  description = "The version of Terraform to use for this workspace. Defaults to the latest available version."
  default     = null
  type        = string
}

variable "vcs_repo" {
  description = "The VCS repository to configure."
  default = {
  }
  type = map(string)
}
